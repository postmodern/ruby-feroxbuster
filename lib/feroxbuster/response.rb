module Feroxbuster
  #
  # Represents response data, either parsed from `.txt` or `.json` output.
  #
  class Response

    # The URL that was requested.
    #
    # @return [String]
    attr_reader :url

    # The "original" URL that was requested.
    #
    # @return [String]
    attr_reader :original_url

    # The path that was requested.
    #
    # @return [String, nil]
    attr_reader :path

    # @return [Boolean, nil]
    attr_reader :wildcard

    # The HTTP response status code.
    #
    # @return [Integer]
    attr_reader :status

    # The HTTP method used for the request.
    #
    # @return [String]
    attr_reader :method

    # The `Content-Length` of the response.
    #
    # @return [Integer]
    attr_reader :content_length

    # The line count of the response.
    #
    # @return [Integer]
    attr_reader :line_count

    # The word count of the response.
    #
    # @return [Integer]
    attr_reader :word_count

    # the HTTP headers of the response.
    #
    # @return [Hash{String => String}, nil]
    attr_reader :headers

    # @return [String, nil]
    attr_reader :extension

    #
    # Initializes the response object.
    #
    # @param [String] url
    #   The URL that was requested.
    #
    # @param [String] original_url
    #   The "original" URL that was requested.
    #
    # @param [String, nil] path
    #   The path that was requested.
    #
    # @param [Boolean, nil] wildcard
    #
    # @param [Integer] status
    #   The HTTP response status code.
    #
    # @param [String] method
    #   The HTTP method used for the request.
    #
    # @param [Integer] content_length
    #   The `Content-Length` of the response.
    #
    # @param [Integer] line_count
    #   The line count of the response.
    #
    # @param [Integer] word_count
    #   The word count of the response.
    #
    # @param [Hash{String => String}, nil] headers
    #   the HTTP headers of the response.
    #
    # @param [String, nil] extension
    #
    def initialize(url:            ,
                   original_url:   nil,
                   path:           nil,
                   wildcard:       nil,
                   status:         ,
                   method:         ,
                   content_length: ,
                   line_count:     ,
                   word_count:     ,
                   headers:        nil,
                   extension:      nil)
      @url            = url
      @original_url   = original_url
      @path           = path
      @wildcard       = wildcard
      @status         = status
      @method         = method
      @content_length = content_length
      @line_count     = line_count
      @word_count     = word_count
      @headers        = headers
      @extension      = extension
    end

  end
end
