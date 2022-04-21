require 'feroxbuster/response'
require 'feroxbuster/statistics'

require 'json'

module Feroxbuster
  module Parsers
    #
    # Parses single-line JSON hashes.
    #
    # @api semipublic
    #
    module JSON
      #
      # Parses a single-line of JSON.
      #
      # @param [IO] io
      #   The IO stream to parse.
      #
      # @yield [data]
      #   The given block will be passed each parsed data.
      #
      # @yieldparam [Response, Statistics] data
      #   The parsed data. {Statistics} will be yielded last.
      #
      # @return [Enumerator]
      #   If no block is given, an Enumerator will be returned.
      #
      def self.parse(io)
        return enum_for(__method__,io) unless block_given?

        io.each_line do |line|
          line.chomp!
          json = ::JSON.parse(line)

          case json["type"]
          when "response"
            yield map_response(json)
          when "statistics"
            yield map_statistics(json)
          else
            raise(NotImplementedError,"unsupported JSON type: #{json['type']}")
          end
        end
      end

      private

      #
      # Maps a response type JSON Hash to a {Response} object.
      #
      # @param [Hash{Symbol => Object}] json
      #   The parsed JSON Hash.
      #
      # @return [Respnse]
      #   The resulting response object.
      #
      def self.map_response(json)
        Response.new(
          url:            json['url'],
          original_url:   json['original_url'],
          path:           json['path'],
          wildcard:       json['wildcard'],
          status:         json['status'],
          method:         json['method'],
          content_length: json['content_length'],
          line_count:     json['line_count'],
          word_count:     json['word_count'],
          headers:        json['headers'],
          extension:      json['extension']
        )
      end

      #
      # Maps a statistics type JSON Hash to a {Statistics} object.
      #
      # @param [Hash{Symbol => Object}] json
      #   The parsed JSON Hash.
      #
      # @return [Statistics]
      #   The resulting statistics object.
      #
      def self.map_statistics(json)
        Statistics.new(
          timeouts:             json['timeouts'],
          requests:             json['requests'],
          expected_per_scan:    json['expected_per_scan'],
          total_expected:       json['total_expected'],
          errors:               json['errors'],
          successes:            json['successes'],
          redirects:            json['redirects'],
          client_errors:        json['client_errors'],
          server_errors:        json['server_errors'],
          total_scans:          json['total_scans'],
          initial_targets:      json['initial_targets'],
          links_extracted:      json['links_extracted'],
          extensions_collected: json['extensions_collected'],
          status_200s:          json['status_200s'],
          status_301s:          json['status_301s'],
          status_302s:          json['status_302s'],
          status_401s:          json['status_401s'],
          status_403s:          json['status_403s'],
          status_429s:          json['status_429s'],
          status_500s:          json['status_500s'],
          status_503s:          json['status_503s'],
          status_504s:          json['status_504s'],
          status_508s:          json['status_508s'],
          wildcards_filtered:   json['wildcards_filtered'],
          responses_filtered:   json['responses_filtered'],
          resources_discovered: json['resources_discovered'],
          url_format_errors:    json['url_format_errors'],
          redirection_errors:   json['redirection_errors'],
          connection_errors:    json['connection_errors'],
          request_errors:       json['request_errors'],
          directory_scan_times: json['directory_scan_times'],
          total_runtime:        json['total_runtime']
        )
      end
    end
  end
end
