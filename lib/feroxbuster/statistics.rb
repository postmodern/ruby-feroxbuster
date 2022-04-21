module Feroxbuster
  class Statistics

    # @return [Integer]
    attr_reader :timeouts

    # @return [Integer]
    attr_reader :requests

    # @return [Integer]
    attr_reader :expected_per_scan

    # @return [Integer]
    attr_reader :total_expected

    # @return [Integer]
    attr_reader :errors

    # @return [Integer]
    attr_reader :successes

    # @return [Integer]
    attr_reader :redirects

    # @return [Integer]
    attr_reader :client_errors

    # @return [Integer]
    attr_reader :server_errors

    # @return [Integer]
    attr_reader :total_scans

    # @return [Integer]
    attr_reader :initial_targets

    # @return [Integer]
    attr_reader :links_extracted

    # @return [Integer]
    attr_reader :extensions_collected

    # @return [Integer]
    attr_reader :status_200s

    # @return [Integer]
    attr_reader :status_301s

    # @return [Integer]
    attr_reader :status_302s

    # @return [Integer]
    attr_reader :status_401s

    # @return [Integer]
    attr_reader :status_403s

    # @return [Integer]
    attr_reader :status_429s

    # @return [Integer]
    attr_reader :status_500s

    # @return [Integer]
    attr_reader :status_503s

    # @return [Integer]
    attr_reader :status_504s

    # @return [Integer]
    attr_reader :status_508s

    # @return [Integer]
    attr_reader :wildcards_filtered

    # @return [Integer]
    attr_reader :responses_filtered

    # @return [Integer]
    attr_reader :resources_discovered

    # @return [Integer]
    attr_reader :url_format_errors

    # @return [Integer]
    attr_reader :redirection_errors

    # @return [Integer]
    attr_reader :connection_errors

    # @return [Integer]
    attr_reader :request_errors

    # @return [Array<Float>]
    attr_reader :directory_scan_times

    # @return [Array<Float>]
    attr_reader :total_runtime

    #
    # Initializes the statistics object.
    #
    def initialize(timeouts: 0,
                   requests: 0,
                   expected_per_scan: 6,
                   total_expected: 0,
                   errors: 0,
                   successes: 0,
                   redirects: 0,
                   client_errors: 0,
                   server_errors: 0,
                   total_scans: 0,
                   initial_targets: 0,
                   links_extracted: 0,
                   extensions_collected: 0,
                   status_200s: 0,
                   status_301s: 0,
                   status_302s: 0,
                   status_401s: 0,
                   status_403s: 0,
                   status_429s: 0,
                   status_500s: 0,
                   status_503s: 0,
                   status_504s: 0,
                   status_508s: 0,
                   wildcards_filtered: 0,
                   responses_filtered: 0,
                   resources_discovered: 0,
                   url_format_errors: 0,
                   redirection_errors: 0,
                   connection_errors: 0,
                   request_errors: 0,
                   directory_scan_times: [],
                   total_runtime: [])
      @timeouts = timeouts
      @requests = requests
      @expected_per_scan = expected_per_scan
      @total_expected = total_expected
      @errors = errors
      @successes = successes
      @redirects = redirects
      @client_errors = client_errors
      @server_errors = server_errors
      @total_scans = total_scans
      @initial_targets = initial_targets
      @links_extracted = links_extracted
      @extensions_collected = extensions_collected
      @status_200s = status_200s
      @status_301s = status_301s
      @status_302s = status_302s
      @status_401s = status_401s
      @status_403s = status_403s
      @status_429s = status_429s
      @status_500s = status_500s
      @status_503s = status_503s
      @status_504s = status_504s
      @status_508s = status_508s
      @wildcards_filtered = wildcards_filtered
      @responses_filtered = responses_filtered
      @resources_discovered = resources_discovered
      @url_format_errors = url_format_errors
      @redirection_errors = redirection_errors
      @connection_errors = connection_errors
      @request_errors = request_errors
      @directory_scan_times = directory_scan_times
      @total_runtime = total_runtime
    end

  end
end
