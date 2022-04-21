require 'spec_helper'
require 'feroxbuster/output_file'

describe Feroxbuster::OutputFile do
  let(:fixtures_dir) { File.expand_path(File.join(__dir__,'fixtures')) }

  describe ".infer_format" do
    subject { described_class.infer_format(path) }

    context "when the path ends in .json" do
      let(:path) { '/path/to/file.json' }

      it { expect(subject).to eq(:json) }
    end

    context "when the path ends in .txt" do
      let(:path) { '/path/to/file.txt' }

      it { expect(subject).to eq(:txt) }
    end
  end

  describe "PARSERS" do
    subject { described_class::PARSERS }

    describe ":txt" do
      it { expect(subject[:txt]).to eq(Feroxbuster::Parsers::TXT) }
    end

    describe ":json" do
      it { expect(subject[:json]).to eq(Feroxbuster::Parsers::JSON) }
    end
  end

  describe "FILE_FORMATS" do
    subject { described_class::FILE_FORMATS }

    describe ".txt" do
      it { expect(subject['.txt']).to be(:txt) }
    end

    describe ".json" do
      it { expect(subject['.json']).to be(:json) }
    end
  end

  describe "#initialize" do
    let(:path) { "/path/to/file.json" }

    subject { described_class.new(path) }

    it "must set #path" do
      expect(subject.path).to eq(path)
    end

    it "must infer the format from the file's extname" do
      expect(subject.format).to eq(:json)
    end

    it "must set #parser based on #format" do
      expect(subject.parser).to eq(described_class::PARSERS[subject.format])
    end

    context "when given an format: keyword" do
      let(:format) { :txt }

      subject { described_class.new(path, format: format) }

      it "must set #format" do
        expect(subject.format).to be(format)
      end

      it "must set #parser based on the given format:" do
        expect(subject.parser).to eq(described_class::PARSERS[format])
      end
    end
  end

  let(:path) { File.join(fixtures_dir,'output.json') }

  subject { described_class.new(path) }

  describe "#each" do
    context "when a block is given" do
      it "must yield each parsed Response object" do
        yielded_objects = []

        subject.each do |object|
          yielded_objects << object
        end

        expect(yielded_objects).to_not be_empty
        expect(yielded_objects[0..-2]).to all(be_kind_of(Feroxbuster::Response))

        expect(yielded_objects.last).to be_kind_of(Feroxbuster::Statistics)
      end
    end

    context "when no block is given" do
      it "must return an Enumerator of the parsed Response objects" do
        objects = subject.each.to_a

        expect(objects).to_not be_empty
        expect(objects[0..-2]).to all(be_kind_of(Feroxbuster::Response))

        expect(objects.last).to be_kind_of(Feroxbuster::Statistics)
      end
    end
  end

  describe "#to_s" do
    it "must return #path" do
      expect(subject.to_s).to eq(path)
    end
  end
end
