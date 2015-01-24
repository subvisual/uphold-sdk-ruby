module Bitreserve
  class Request
    include ::HTTParty
    base_uri "#{Bitreserve.api_base}/v#{Bitreserve.api_version}"

    def self.perform_with_objects(http_method, path, klass, client)
      new(path, client).public_send(http_method).map do |element|
        klass.new(element)
      end
    end

    def self.perform_with_object(http_method, path, klass, client)
      response = new(path, client).public_send(http_method)
      klass.new(response)
    end

    def initialize(path, client)
      @path = path
      @client = client
      add_headers
    end

    def get
      response = Request.get(path)
      log_request_info(:get, response)
      response.parsed_response
    end

    def post
      response = Request.post(path)
      log_request_info(:post, response)
      response.parsed_response
    end

    private

    attr_reader :path, :client

    def add_headers
      return unless client.bearer_token?

      Request.headers 'Authorization' => "Bearer #{client.bearer_token}"
    end

    def log_request_info(http_method, response)
      Bitreserve.logger.info "[Bitreserve] [#{current_time}] #{http_method.to_s.upcase} #{Request.base_uri}#{path} #{Request.headers} #{response.code}"
    end

    def current_time
      Time.now.utc.strftime('%d/%b/%Y %H:%M:%S %Z')
    end
  end
end
