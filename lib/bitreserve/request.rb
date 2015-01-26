module Bitreserve
  class Request
    include ::HTTParty
    base_uri "#{Bitreserve.api_base}/v#{Bitreserve.api_version}"

    def self.perform_with_objects(http_method, request_data)
      response = new(request_data).public_send(http_method)
      request_data.entity.from_collection(response)
    end

    def self.perform_with_object(http_method, request_data)
      response = new(request_data).public_send(http_method)
      request_data.entity.new(response)
    end

    def initialize(request_data)
      @path = request_data.endpoint
      @data = request_data.payload
      @auth = request_data.auth
      Request.headers request_data.headers
      base_uri_for_auth
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

    attr_reader :path, :data, :auth

    def base_uri_for_auth
      return unless auth

      Request.base_uri "#{Bitreserve.api_base}"
    end

    def options
      options = {}
      if auth
        options.merge!(basic_auth: auth)
      end

      if data
        options.merge!(body: data)
      end
      options
    end

    def log_request_info(http_method, response)
      Bitreserve.logger.info "[Bitreserve] #{http_method.to_s.upcase} #{Request.base_uri}#{path} #{Request.headers} #{response.code}"
    end
  end
end
