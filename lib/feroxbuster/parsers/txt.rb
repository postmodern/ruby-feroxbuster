require 'feroxbuster/response'

module Feroxbuster
  module Parsers
    #
    # Parses single-line response data.
    #
    # @api semipublic
    #
    module TXT
      #
      # Parses each line of plain-text.
      #
      # @param [IO] io
      #   The IO stream to parse.
      #
      # @yield [response]
      #   The given block will be passed each parsed response.
      #
      # @yieldparam [Response] response
      #   The parsed response.
      #
      # @return [Enumerator]
      #   If no block is given, an Enumerator will be returned.
      #
      def self.parse(io)
        return enum_for(__method__,io) unless block_given?

        line_regexp = /^(\d{3})\s+(\w+)\s+(\d+)l\s+(\d+)w\s+(\d+)c\s+([^\s]+)/

        io.each_line do |line|
          line.chomp!

          if (match = line.match(line_regexp))
            yield Response.new(
              status:         match[1].to_i,
              method:         match[2],
              line_count:     match[3].to_i,
              word_count:     match[4].to_i,
              content_length: match[5].to_i,
              url:            match[6]
            )
          end
        end
      end
    end
  end
end
