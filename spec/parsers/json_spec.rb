require 'spec_helper'
require 'feroxbuster/parsers/json'

describe Feroxbuster::Parsers::JSON do
  describe ".parse" do
    let(:line) { json }
    let(:io)   { StringIO.new(line + $/) }

    let(:parsed_json) { JSON.parse(json) }

    context "when the JSON \"type\" attribute is \"response\"" do
      let(:json) do
        "{\"type\":\"response\",\"url\":\"https://github.com/test\",\"original_url\":\"https://github.com\",\"path\":\"/test\",\"wildcard\":false,\"status\":200,\"method\":\"GET\",\"content_length\":0,\"line_count\":2010,\"word_count\":11253,\"headers\":{\"permissions-policy\":\"interest-cohort=()\",\"accept-ranges\":\"bytes\",\"referrer-policy\":\"origin-when-cross-origin, strict-origin-when-cross-origin\",\"x-content-type-options\":\"nosniff\",\"cache-control\":\"max-age=0, private, must-revalidate\",\"expect-ct\":\"max-age=2592000, report-uri=\\\"https://api.github.com/_private/browser/errors\\\"\",\"server\":\"GitHub.com\",\"x-github-request-id\":\"85A8:0E10:20B03E:27719A:6260B1D5\",\"transfer-encoding\":\"chunked\",\"date\":\"Thu, 21 Apr 2022 01:22:16 GMT\",\"strict-transport-security\":\"max-age=31536000; includeSubdomains; preload\",\"etag\":\"W/\\\"7c98cb0440eb94eddcfd360497fae419\\\"\",\"x-frame-options\":\"deny\",\"content-security-policy\":\"default-src 'none'; base-uri 'self'; block-all-mixed-content; child-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/; connect-src 'self' uploads.github.com objects-origin.githubusercontent.com www.githubstatus.com collector.github.com raw.githubusercontent.com api.github.com github-cloud.s3.amazonaws.com github-production-repository-file-5c1aeb.s3.amazonaws.com github-production-upload-manifest-file-7fdce7.s3.amazonaws.com github-production-user-asset-6210df.s3.amazonaws.com cdn.optimizely.com logx.optimizely.com/v1/events translator.github.com *.actions.githubusercontent.com wss://*.actions.githubusercontent.com online.visualstudio.com/api/v1/locations github-production-repository-image-32fea6.s3.amazonaws.com github-production-release-asset-2e65be.s3.amazonaws.com insights.github.com wss://alive.github.com; font-src github.githubassets.com; form-action 'self' github.com gist.github.com objects-origin.githubusercontent.com; frame-ancestors 'none'; frame-src render.githubusercontent.com viewscreen.githubusercontent.com notebooks.githubusercontent.com; img-src 'self' data: github.githubassets.com identicons.github.com github-cloud.s3.amazonaws.com secured-user-images.githubusercontent.com/ *.githubusercontent.com; manifest-src 'self'; media-src github.com user-images.githubusercontent.com/; script-src github.githubassets.com; style-src 'unsafe-inline' github.githubassets.com; worker-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/\",\"x-xss-protection\":\"0\",\"set-cookie\":\"logged_in=no; Path=/; Domain=github.com; Expires=Fri, 21 Apr 2023 01:22:29 GMT; HttpOnly; Secure; SameSite=Lax\",\"vary\":\"X-Requested-With, X-PJAX-Container, Accept-Encoding, Accept, X-Requested-With\",\"content-type\":\"text/html; charset=utf-8\"},\"extension\":\"\"}"
      end

      it "must parse each line and yield Feroxbuster::Response objects" do
        yielded_objects = []

        subject.parse(io) do |response|
          yielded_objects << response
        end

        expect(yielded_objects.length).to eq(1)
        expect(yielded_objects.first).to be_kind_of(Feroxbuster::Response)

        yielded_response = yielded_objects.first
        expect(yielded_response.url).to eq(parsed_json['url'])
        expect(yielded_response.original_url).to eq(parsed_json['original_url'])
        expect(yielded_response.path).to eq(parsed_json['path'])
        expect(yielded_response.wildcard).to eq(parsed_json['wildcard'])
        expect(yielded_response.status).to eq(parsed_json['status'])
        expect(yielded_response.method).to eq(parsed_json['method'])
        expect(yielded_response.content_length).to eq(parsed_json['content_length'])
        expect(yielded_response.line_count).to eq(parsed_json['line_count'])
        expect(yielded_response.word_count).to eq(parsed_json['word_count'])
        expect(yielded_response.headers).to eq(parsed_json['headers'])
        expect(yielded_response.extension).to eq(parsed_json['extension'])
      end
    end

    context "when the JSON \"type\" attribute is \"statistics\"" do
      let(:json) do
        "{\"type\":\"statistics\",\"timeouts\":0,\"requests\":18,\"expected_per_scan\":6,\"total_expected\":12,\"errors\":0,\"successes\":12,\"redirects\":0,\"client_errors\":6,\"server_errors\":0,\"total_scans\":2,\"initial_targets\":0,\"links_extracted\":0,\"extensions_collected\":0,\"status_200s\":12,\"status_301s\":0,\"status_302s\":0,\"status_401s\":0,\"status_403s\":0,\"status_429s\":0,\"status_500s\":0,\"status_503s\":0,\"status_504s\":0,\"status_508s\":0,\"wildcards_filtered\":0,\"responses_filtered\":0,\"resources_discovered\":4,\"url_format_errors\":0,\"redirection_errors\":0,\"connection_errors\":0,\"request_errors\":0,\"directory_scan_times\":[0.434531853,0.434228035],\"total_runtime\":[1.6527268240000001]}"
      end

      it "must parse each line and yield Feroxbuster::Statistics objects" do
        yielded_objects = []

        subject.parse(io) do |statistics|
          yielded_objects << statistics
        end

        expect(yielded_objects.length).to eq(1)
        expect(yielded_objects.first).to be_kind_of(Feroxbuster::Statistics)

        yielded_statistics = yielded_objects.first
        expect(yielded_statistics.timeouts).to eq(parsed_json['timeouts'])
        expect(yielded_statistics.requests).to eq(parsed_json['requests'])
        expect(yielded_statistics.expected_per_scan).to eq(parsed_json['expected_per_scan'])
        expect(yielded_statistics.total_expected).to eq(parsed_json['total_expected'])
        expect(yielded_statistics.errors).to eq(parsed_json['errors'])
        expect(yielded_statistics.successes).to eq(parsed_json['successes'])
        expect(yielded_statistics.redirects).to eq(parsed_json['redirects'])
        expect(yielded_statistics.client_errors).to eq(parsed_json['client_errors'])
        expect(yielded_statistics.server_errors).to eq(parsed_json['server_errors'])
        expect(yielded_statistics.total_scans).to eq(parsed_json['total_scans'])
        expect(yielded_statistics.initial_targets).to eq(parsed_json['initial_targets'])
        expect(yielded_statistics.links_extracted).to eq(parsed_json['links_extracted'])
        expect(yielded_statistics.extensions_collected).to eq(parsed_json['extensions_collected'])
        expect(yielded_statistics.status_200s).to eq(parsed_json['status_200s'])
        expect(yielded_statistics.status_301s).to eq(parsed_json['status_301s'])
        expect(yielded_statistics.status_302s).to eq(parsed_json['status_302s'])
        expect(yielded_statistics.status_401s).to eq(parsed_json['status_401s'])
        expect(yielded_statistics.status_403s).to eq(parsed_json['status_403s'])
        expect(yielded_statistics.status_429s).to eq(parsed_json['status_429s'])
        expect(yielded_statistics.status_500s).to eq(parsed_json['status_500s'])
        expect(yielded_statistics.status_503s).to eq(parsed_json['status_503s'])
        expect(yielded_statistics.status_504s).to eq(parsed_json['status_504s'])
        expect(yielded_statistics.status_508s).to eq(parsed_json['status_508s'])
        expect(yielded_statistics.wildcards_filtered).to eq(parsed_json['wildcards_filtered'])
        expect(yielded_statistics.responses_filtered).to eq(parsed_json['responses_filtered'])
        expect(yielded_statistics.resources_discovered).to eq(parsed_json['resources_discovered'])
        expect(yielded_statistics.url_format_errors).to eq(parsed_json['url_format_errors'])
        expect(yielded_statistics.redirection_errors).to eq(parsed_json['redirection_errors'])
        expect(yielded_statistics.connection_errors).to eq(parsed_json['connection_errors'])
        expect(yielded_statistics.request_errors).to eq(parsed_json['request_errors'])
        expect(yielded_statistics.directory_scan_times).to eq(parsed_json['directory_scan_times'])
        expect(yielded_statistics.total_runtime).to eq(parsed_json['total_runtime'])
      end
    end
  end
end
