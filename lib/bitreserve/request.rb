module Bitreserve
  class BaseRequest
    include ::HTTParty

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
      @headers = request_data.headers
    end

    def get
      response = self.class.get(path, options)
      log_request_info(:get, response)
      response.parsed_response
    end

    def post
      response = self.class.post(path, options)
      log_request_info(:post, response)
      response.parsed_response
    end

    private

    attr_reader :path, :data, :auth, :headers

    def options
      { basic_auth: auth, body: data, headers: headers }.
        reject { |_k, v| v.nil? }
    end

    def log_request_info(http_method, response)
      Bitreserve.logger.info "[Bitreserve] #{http_method.to_s.upcase} #{self.class.base_uri}#{path} #{self.class.headers} #{response.code}"
    end
  end

  class Request < BaseRequest
    base_uri "#{Bitreserve.api_base}/v#{Bitreserve.api_version}"
  end

  class AuthRequest < Request
    base_uri Bitreserve.api_base
  end
end
