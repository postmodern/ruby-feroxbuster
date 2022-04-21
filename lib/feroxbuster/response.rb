module Feroxbuster
  class Response

    # @return [String]
    attr_reader :url

    # @return [String]
    attr_reader :original_url

    # @return [String, nil]
    attr_reader :path

    # @return [Boolean, nil]
    attr_reader :wildcard

    # @return [Integer]
    attr_reader :status

    # @return [String]
    attr_reader :method

    # @return [Integer]
    attr_reader :content_length

    # @return [Integer]
    attr_reader :line_count

    # @return [Integer]
    attr_reader :word_count

    # @return [Hash{String => String}, nil]
    attr_reader :headers

    # @return [String, nil]
    attr_reader :extension

    #
    # Initializes the response object.
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
