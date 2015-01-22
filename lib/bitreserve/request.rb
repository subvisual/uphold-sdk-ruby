module Bitreserve
  class Request
    include ::HTTParty
    base_uri "#{Bitreserve.api_base}/v#{Bitreserve.api_version}"

    def self.perform(http_method, path, options = {})
      new(path, options).public_send(http_method)
    end

    def initialize(path, options)
      @path = path
      @options = options
    end

    def get
      response = Request.get(path, options)
      log_request_info(:get, response)
      response.parsed_response
    end

    def post
      response = Request.post(path, options)
      log_request_info(:post, response)
      response.parsed_response
    end

    private

    attr_reader :path, :options

    def log_request_info(http_method, response)
      Bitreserve.logger.info "[Bitreserve] [#{current_time}] #{http_method.to_s.upcase} #{Request.base_uri}#{path} #{options} #{response.code}"
    end

    def current_time
      Time.now.utc.strftime('%d/%b/%Y %H:%M:%S %Z')
    end
  end
end
