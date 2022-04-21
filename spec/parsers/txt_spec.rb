require 'spec_helper'
require 'feroxbuster/parsers/txt'

describe Feroxbuster::Parsers::TXT do
  describe ".parse" do
    let(:status) { 200 }
    let(:method) { "GET" }
    let(:url)    { "https://github.com/test" }

    let(:line_count)     { 2010 }
    let(:word_count)     { 11253 }
    let(:content_length) { 0 }

    let(:line) do
      "#{status}      #{method}     #{line_count}l    #{word_count}w        #{content_length}c #{url}"
    end
    let(:io) { StringIO.new(line + $/) }

    it "must parse each line and yield Feroxbuster::Response objects" do
      yielded_responses = []

      subject.parse(io) do |response|
        yielded_responses << response
      end

      expect(yielded_responses.length).to eq(1)
      expect(yielded_responses.first).to be_kind_of(Feroxbuster::Response)

      yielded_response = yielded_responses.first
      expect(yielded_response.status).to eq(status)
      expect(yielded_response.method).to eq(method)
      expect(yielded_response.url).to eq(url)
      expect(yielded_response.line_count).to eq(line_count)
      expect(yielded_response.word_count).to eq(word_count)
      expect(yielded_response.content_length).to eq(content_length)
    end

    context "when there is other output mixed in" do
      let(:lines) do
        [
          "",
          " ___  ___  __   __     __      __         __   ___",
          "|__  |__  |__) |__) | /  `    /  \ \_/ | |  \ |__",
          "|    |___ |  \ |  \ | \__,    \__/ / \ | |__/ |___",
          "by Ben \"epi\" Risher 🤓                 ver: 2.7.0",
          "───────────────────────────┬──────────────────────",
          " 🎯  Target Url            │ https://github.com",
          " 🚀  Threads               │ 50",
          " 📖  Wordlist              │ ./feroxbuster/wordlist.txt",
          " 👌  Status Codes          │ [200, 204, 301, 302, 307, 308, 401, 403, 405, 500]",
          " 💥  Timeout (secs)        │ 7",
          " 🦡  User-Agent            │ feroxbuster/2.7.0",
          " 💉  Config File           │ /home/postmodern/.config/feroxbuster/ferox-config.toml",
          " 🏁  HTTP methods          │ [GET]",
          " 🔃  Recursion Depth       │ 4",
          "───────────────────────────┴──────────────────────",
          " 🏁  Press [ENTER] to use the Scan Management Menu™",
          "──────────────────────────────────────────────────",
          line,
            "[####################] - 1s        12/12      0s      found:3       errors:0      ",
            "[####################] - 0s         6/6       4/s     https://github.com ",
            "[####################] - 0s         6/6       9/s     https://github.com/ ",
            ''
        ]
      end
      let(:io) { StringIO.new(lines.join($/)) }

      it "must ignore the other output lines" do
        yielded_responses = []

        subject.parse(io) do |response|
          yielded_responses << response
        end

        expect(yielded_responses.length).to eq(1)
        expect(yielded_responses.first).to be_kind_of(Feroxbuster::Response)

        yielded_response = yielded_responses.first
        expect(yielded_response.status).to eq(status)
        expect(yielded_response.method).to eq(method)
        expect(yielded_response.url).to eq(url)
        expect(yielded_response.line_count).to eq(line_count)
        expect(yielded_response.word_count).to eq(word_count)
        expect(yielded_response.content_length).to eq(content_length)
      end
    end
  end
end
