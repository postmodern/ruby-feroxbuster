# ruby-feroxbuster

[![CI](https://github.com/postmodern/ruby-feroxbuster/actions/workflows/ruby.yml/badge.svg)](https://github.com/postmodern/ruby-gobuster/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/ruby-feroxbuster.svg)](https://badge.fury.io/rb/ruby-gobuster)

* [Source](https://github.com/postmodern/ruby-feroxbuster/)
* [Issues](https://github.com/postmodern/ruby-feroxbuster/issues)
* [Documentation](http://rubydoc.info/gems/ruby-feroxbuster/frames)

## Description

A Ruby interface to [feroxbuster], a simple, fast, recursive content discovery
tool written in Rust.

## Features

* Provides a [Ruby interface][Feroxbuster::Command] for running the
  `feroxbuster` command.
* Supports [parsing][Feroxbuster::OutputFile] `feroxbuster` `.txt` and `.json`
  output files.

[Feroxbuster::Command]: https://rubydoc.info/gems/ruby-feroxbuster/Feroxbuster/Command
[Feroxbuster::OutputFile]: https://rubydoc.info/gems/ruby-amass/Feroxbuster/OutputFile

## Examples

Run `feroxbuster --wordlist /path/to/wordlist.txt --url https://example.com` from Ruby:

```ruby
require 'feroxbuster/command'

Feroxbuster::Command.run(wordlist: '/path/to/wordlist.txt', url: 'https://example.com')
```

Parser an `feroxbuster` JSON file:

```ruby
require 'feroxbuster/output_file'

output_file = Feroxbuster::OutputFile.new('/path/to/feroxbuster.json')
output_file.each do |object|
  p object
end
```

```
#<Feroxbuster::Response:0x000056472fab3390 @url="https://github.com/test", @original_url="https://github.com", @path="/test", @wildcard=false, @status=200, @method="GET", @content_length=0, @line_count=2010, @word_count=11253, @headers={"permissions-policy"=>"interest-cohort=()", "accept-ranges"=>"bytes", "referrer-policy"=>"origin-when-cross-origin, strict-origin-when-cross-origin", "x-content-type-options"=>"nosniff", "cache-control"=>"max-age=0, private, must-revalidate", "expect-ct"=>"max-age=2592000, report-uri=\"https://api.github.com/_private/browser/errors\"", "server"=>"GitHub.com", "x-github-request-id"=>"85A8:0E10:20B03E:27719A:6260B1D5", "transfer-encoding"=>"chunked", "date"=>"Thu, 21 Apr 2022 01:22:16 GMT", "strict-transport-security"=>"max-age=31536000; includeSubdomains; preload", "etag"=>"W/\"7c98cb0440eb94eddcfd360497fae419\"", "x-frame-options"=>"deny", "content-security-policy"=>"default-src 'none'; base-uri 'self'; block-all-mixed-content; child-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/; connect-src 'self' uploads.github.com objects-origin.githubusercontent.com www.githubstatus.com collector.github.com raw.githubusercontent.com api.github.com github-cloud.s3.amazonaws.com github-production-repository-file-5c1aeb.s3.amazonaws.com github-production-upload-manifest-file-7fdce7.s3.amazonaws.com github-production-user-asset-6210df.s3.amazonaws.com cdn.optimizely.com logx.optimizely.com/v1/events translator.github.com *.actions.githubusercontent.com wss://*.actions.githubusercontent.com online.visualstudio.com/api/v1/locations github-production-repository-image-32fea6.s3.amazonaws.com github-production-release-asset-2e65be.s3.amazonaws.com insights.github.com wss://alive.github.com; font-src github.githubassets.com; form-action 'self' github.com gist.github.com objects-origin.githubusercontent.com; frame-ancestors 'none'; frame-src render.githubusercontent.com viewscreen.githubusercontent.com notebooks.githubusercontent.com; img-src 'self' data: github.githubassets.com identicons.github.com github-cloud.s3.amazonaws.com secured-user-images.githubusercontent.com/ *.githubusercontent.com; manifest-src 'self'; media-src github.com user-images.githubusercontent.com/; script-src github.githubassets.com; style-src 'unsafe-inline' github.githubassets.com; worker-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/", "x-xss-protection"=>"0", "set-cookie"=>"logged_in=no; Path=/; Domain=github.com; Expires=Fri, 21 Apr 2023 01:22:29 GMT; HttpOnly; Secure; SameSite=Lax", "vary"=>"X-Requested-With, X-PJAX-Container, Accept-Encoding, Accept, X-Requested-With", "content-type"=>"text/html; charset=utf-8"}, @extension="">
#<Feroxbuster::Response:0x000056472fab20f8 @url="https://github.com/dev", @original_url="https://github.com", @path="/dev", @wildcard=false, @status=200, @method="GET", @content_length=0, @line_count=2067, @word_count=11308, @headers={"date"=>"Thu, 21 Apr 2022 01:22:17 GMT", "cache-control"=>"max-age=0, private, must-revalidate", "content-security-policy"=>"default-src 'none'; base-uri 'self'; block-all-mixed-content; child-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/; connect-src 'self' uploads.github.com objects-origin.githubusercontent.com www.githubstatus.com collector.github.com raw.githubusercontent.com api.github.com github-cloud.s3.amazonaws.com github-production-repository-file-5c1aeb.s3.amazonaws.com github-production-upload-manifest-file-7fdce7.s3.amazonaws.com github-production-user-asset-6210df.s3.amazonaws.com cdn.optimizely.com logx.optimizely.com/v1/events translator.github.com *.actions.githubusercontent.com wss://*.actions.githubusercontent.com online.visualstudio.com/api/v1/locations github-production-repository-image-32fea6.s3.amazonaws.com github-production-release-asset-2e65be.s3.amazonaws.com insights.github.com wss://alive.github.com; font-src github.githubassets.com; form-action 'self' github.com gist.github.com objects-origin.githubusercontent.com; frame-ancestors 'none'; frame-src render.githubusercontent.com viewscreen.githubusercontent.com notebooks.githubusercontent.com; img-src 'self' data: github.githubassets.com identicons.github.com github-cloud.s3.amazonaws.com secured-user-images.githubusercontent.com/ *.githubusercontent.com; manifest-src 'self'; media-src github.com user-images.githubusercontent.com/; script-src github.githubassets.com; style-src 'unsafe-inline' github.githubassets.com; worker-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/", "set-cookie"=>"logged_in=no; Path=/; Domain=github.com; Expires=Fri, 21 Apr 2023 01:22:29 GMT; HttpOnly; Secure; SameSite=Lax", "permissions-policy"=>"interest-cohort=()", "x-frame-options"=>"deny", "server"=>"GitHub.com", "accept-ranges"=>"bytes", "etag"=>"W/\"3ca853f280bb864544f7842cdaa124e5\"", "vary"=>"X-Requested-With, X-PJAX-Container, Accept-Encoding, Accept, X-Requested-With", "referrer-policy"=>"origin-when-cross-origin, strict-origin-when-cross-origin", "x-github-request-id"=>"85AC:2947:2319C4:29E4C8:6260B1D5", "transfer-encoding"=>"chunked", "expect-ct"=>"max-age=2592000, report-uri=\"https://api.github.com/_private/browser/errors\"", "x-content-type-options"=>"nosniff", "content-type"=>"text/html; charset=utf-8", "x-xss-protection"=>"0", "strict-transport-security"=>"max-age=31536000; includeSubdomains; preload"}, @extension="">
#<Feroxbuster::Response:0x000056472fab0f28 @url="https://github.com/www", @original_url="https://github.com", @path="/www", @wildcard=false, @status=200, @method="GET", @content_length=0, @line_count=1813, @word_count=10399, @headers={"content-type"=>"text/html; charset=utf-8", "accept-ranges"=>"bytes", "date"=>"Thu, 21 Apr 2022 01:22:16 GMT", "transfer-encoding"=>"chunked", "vary"=>"X-Requested-With, X-PJAX-Container, Accept-Encoding, Accept, X-Requested-With", "x-xss-protection"=>"0", "x-github-request-id"=>"85B4:4678:28A012:2F9830:6260B1D5", "content-security-policy"=>"default-src 'none'; base-uri 'self'; block-all-mixed-content; child-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/; connect-src 'self' uploads.github.com objects-origin.githubusercontent.com www.githubstatus.com collector.github.com raw.githubusercontent.com api.github.com github-cloud.s3.amazonaws.com github-production-repository-file-5c1aeb.s3.amazonaws.com github-production-upload-manifest-file-7fdce7.s3.amazonaws.com github-production-user-asset-6210df.s3.amazonaws.com cdn.optimizely.com logx.optimizely.com/v1/events translator.github.com *.actions.githubusercontent.com wss://*.actions.githubusercontent.com online.visualstudio.com/api/v1/locations github-production-repository-image-32fea6.s3.amazonaws.com github-production-release-asset-2e65be.s3.amazonaws.com insights.github.com wss://alive.github.com; font-src github.githubassets.com; form-action 'self' github.com gist.github.com objects-origin.githubusercontent.com; frame-ancestors 'none'; frame-src render.githubusercontent.com viewscreen.githubusercontent.com notebooks.githubusercontent.com; img-src 'self' data: github.githubassets.com identicons.github.com github-cloud.s3.amazonaws.com secured-user-images.githubusercontent.com/ *.githubusercontent.com; manifest-src 'self'; media-src github.com user-images.githubusercontent.com/; script-src github.githubassets.com; style-src 'unsafe-inline' github.githubassets.com; worker-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/", "referrer-policy"=>"origin-when-cross-origin, strict-origin-when-cross-origin", "etag"=>"W/\"e03d055bf6b701eb6ecf1fa7c1a137f0\"", "permissions-policy"=>"interest-cohort=()", "strict-transport-security"=>"max-age=31536000; includeSubdomains; preload", "x-frame-options"=>"deny", "set-cookie"=>"logged_in=no; Path=/; Domain=github.com; Expires=Fri, 21 Apr 2023 01:22:29 GMT; HttpOnly; Secure; SameSite=Lax", "expect-ct"=>"max-age=2592000, report-uri=\"https://api.github.com/_private/browser/errors\"", "server"=>"GitHub.com", "cache-control"=>"max-age=0, private, must-revalidate", "x-content-type-options"=>"nosniff"}, @extension="">
#<Feroxbuster::Response:0x000056472fabbcc0 @url="https://github.com/", @original_url="https://github.com", @path="/", @wildcard=false, @status=200, @method="GET", @content_length=0, @line_count=2596, @word_count=13002, @headers={"cache-control"=>"max-age=0, private, must-revalidate", "server"=>"GitHub.com", "set-cookie"=>"logged_in=no; Path=/; Domain=github.com; Expires=Fri, 21 Apr 2023 01:22:29 GMT; HttpOnly; Secure; SameSite=Lax", "permissions-policy"=>"interest-cohort=()", "vary"=>"X-PJAX, X-PJAX-Container, Accept-Language, Accept-Encoding, Accept, X-Requested-With", "content-security-policy"=>"default-src 'none'; base-uri 'self'; block-all-mixed-content; child-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/; connect-src 'self' uploads.github.com objects-origin.githubusercontent.com www.githubstatus.com collector.github.com raw.githubusercontent.com api.github.com github-cloud.s3.amazonaws.com github-production-repository-file-5c1aeb.s3.amazonaws.com github-production-upload-manifest-file-7fdce7.s3.amazonaws.com github-production-user-asset-6210df.s3.amazonaws.com cdn.optimizely.com logx.optimizely.com/v1/events translator.github.com *.actions.githubusercontent.com wss://*.actions.githubusercontent.com online.visualstudio.com/api/v1/locations github-production-repository-image-32fea6.s3.amazonaws.com github-production-release-asset-2e65be.s3.amazonaws.com insights.github.com wss://alive.github.com github.githubassets.com; font-src github.githubassets.com; form-action 'self' github.com gist.github.com objects-origin.githubusercontent.com; frame-ancestors 'none'; frame-src render.githubusercontent.com viewscreen.githubusercontent.com notebooks.githubusercontent.com; img-src 'self' data: github.githubassets.com identicons.github.com github-cloud.s3.amazonaws.com secured-user-images.githubusercontent.com/ *.githubusercontent.com customer-stories-feed.github.com spotlights-feed.github.com; manifest-src 'self'; media-src github.com user-images.githubusercontent.com/ github.githubassets.com; script-src github.githubassets.com; style-src 'unsafe-inline' github.githubassets.com; worker-src github.com/assets-cdn/worker/ gist.github.com/assets-cdn/worker/", "x-xss-protection"=>"0", "expect-ct"=>"max-age=2592000, report-uri=\"https://api.github.com/_private/browser/errors\"", "x-github-request-id"=>"85B2:4670:5B88C:BE8AA:6260B1D5", "date"=>"Thu, 21 Apr 2022 01:22:22 GMT", "strict-transport-security"=>"max-age=31536000; includeSubdomains; preload", "transfer-encoding"=>"chunked", "x-content-type-options"=>"nosniff", "etag"=>"W/\"b1bb181559a6360603ad7f0ed22c198c\"", "accept-ranges"=>"bytes", "x-frame-options"=>"deny", "referrer-policy"=>"origin-when-cross-origin, strict-origin-when-cross-origin", "content-type"=>"text/html; charset=utf-8", "content-language"=>"en-US"}, @extension="">
#<Feroxbuster::Statistics:0x000056472fabacd0 @timeouts=0, @requests=18, @expected_per_scan=6, @total_expected=12, @errors=0, @successes=12, @redirects=0, @client_errors=6, @server_errors=0, @total_scans=2, @initial_targets=0, @links_extracted=0, @extensions_collected=0, @status_200s=12, @status_301s=0, @status_302s=0, @status_401s=0, @status_403s=0, @status_429s=0, @status_500s=0, @status_503s=0, @status_504s=0, @status_508s=0, @wildcards_filtered=0, @responses_filtered=0, @resources_discovered=4, @url_format_errors=0, @redirection_errors=0, @connection_errors=0, @request_errors=0, @directory_scan_times=[0.434531853, 0.434228035], @total_runtime=[1.6527268240000001]>
```

## Requirements

* [ruby] >= 2.0.0
* [feroxbuster] >= 2.7.0
* [command_mapper] ~> 0.2, >= 0.2.1

[ruby]: https://www.ruby-lang.org/
[command_mapper]: https://github.com/postmodern/command_mapper.rb#readme

## Install

```shell
$ gem install ruby-feroxbuster
```

### gemspec

```ruby
gemspec.add_dependency 'ruby-feroxbuster', '~> 0.1'
```

### Gemfile

```ruby
gem 'ruby-feroxbuster', '~> 0.1'
```

## License

Copyright (c) 2022 Hal Brodigan

See {file:LICENSE.txt} for license information.

[feroxbuster]: https://github.com/epi052/feroxbuster#readme
