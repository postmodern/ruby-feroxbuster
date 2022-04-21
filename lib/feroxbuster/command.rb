require 'command_mapper/command'

module Feroxbuster
  class Command < CommandMapper::Command

    #
    # Represents the type for the `--time-limit` option.
    #
    # @api private
    #
    class TimeSpec < CommandMapper::Types::Str

      #
      # Validates the given value.
      #
      # @param [Object] value
      #   The given value to validate.
      #
      # @return [true, (false, String)]
      #   Returns true if the value is considered valid, or false and a
      #   validation message if the value is not valid.
      #
      def validate(value)
        valid, message = super(value)

        unless valid
          return [valid, message]
        end

        value = value.to_s

        unless value =~ /\A\d+(?:m|s|ms|ns)\z/
          return [false, "must be a number and end with 'm', 's', 'ms', or 'ns'"]
        end

        return true
      end

    end

    #
    # Represents an HTTP status code (100 - 599).
    #
    # @api private
    #
    class StatusCode < CommandMapper::Types::Num

      def initialize
        super(range: 100..599)
      end

    end

    command 'feroxbuster' do
      option '--help'
      option '--version'

      # Target selection:
      option '--resume-from', value: {type: InputFile.new}
      option '--stdin'
      option '--url', value: true

      # Composite settings:
      option '--burp'
      option '--burp-replay'
      option '--smart'
      option '--thorough'

      # Proxy settings:
      option '--proxy', value: true
      option '--replay-proxy', value: true
      option '--replay-codes', value: {type: StatusCode.new}, repeats: true

      # Request settings:
      option '--user-agent', value: true
      option '--random-agent'
      option '--cookies', value: true, repeats: true
      option '--data', value: true
      option '--add-slash'
      option '--headers', value: true, repeats: true
      option '--methods', name: :http_methods, value: true, repeats: true
      option '--query', value: true, repeats: true

      # Request filters:
      option '--dont-scan', value: true, repeats: true

      # Response filters:
      option '--filter-status', value: {type: StatusCode.new}, repeats: true
      option '--filter-similar-to', value: true, repeats: true
      option '--filter-lines', value: true, repeats: true
      option '--status-codes', value: {type: StatusCode.new},
                               repeats: true
      option '--filter-size', value: {type: Num.new}, repeats: true
      option '--filter-words', value: {type: Num.new}, repeats: true
      option '--filter-regex', value: true, repeats: true

      # Client settings:
      option '--insecure'
      option '--redirects'
      option '--timeout', value: {type: Num.new}

      # Scan settings:
      option '--auto-bail'
      option '--auto-tune'
      option '--depth', value: {type: Num.new}
      option '--dont-filter'
      option '--extract-links'
      option '--force-recursion'
      option '--scan-list', value: {type: Num.new}
      option '--no-recursion'
      option '--parallel', value: {type: Num.new}
      option '--rate-limit', value: {type: Num.new}
      option '--threads', value: {type: Num.new}
      option '--time-limit', value: {type: TimeSpec.new}
      option '--wordlist', value: {type: InputFile.new}

      # Dynamic collection settings:
      option '--collect-backups'
      option '--collect-extensions'
      option '--collect-words'
      option '--dont-collect', value: true, repeats: true

      # Output settings:
      option '--debug-log', value: true
      option '--json'
      option '--no-state'
      option '--output', value: true
      option '--quiet'
      option '--silent'
      option '--verbosity'
    end

  end
end
