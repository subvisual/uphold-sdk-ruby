# frozen_string_literal: true

module Uphold
  class Request
    class APIError < StandardError; end

    def self.update_base_uri
      base_uri "#{Uphold.api_base}/v#{Uphold.api_version}"
    end

    include ::HTTParty
    update_base_uri

    def self.perform_with_objects(http_method, request_data)
      response = new(request_data).public_send(http_method)

      with_valid_response(response) do
        request_data.entity.from_collection(response.parsed_response, response.headers['content-range'])
      end
    end

    def self.perform_with_object(http_method, request_data)
      response = new(request_data).public_send(http_method)

      with_valid_response(response) do
        request_data.entity.new(response.parsed_response)
      end
    end

    def initialize(request_data)
      @path = request_data.endpoint
      @data = request_data.payload
      @headers = request_data.headers
    end

    def get
      response = self.class.get(path, options)
      log_request_info(:get, response)
      response
    end

    def post
      response = self.class.post(path, options)
      log_request_info(:post, response)
      response
    end

    private

    attr_reader :path, :data, :auth, :headers

    def self.with_valid_response(response)
      return yield unless response.code >= 400

      if response['error_description']
        Entities::OAuthError.new(response)
      else
        Entities::Error.new(response)
      end
    end
    private_class_method :with_valid_response

    def options
      { body: data, headers: headers }.
        reject { |_k, v| v.nil? }
    end

    def log_request_info(http_method, response)
      Uphold.logger.info "[Uphold] #{http_method.to_s.upcase} #{self.class.base_uri}#{path} #{options[:headers]} #{response.code}"
      Uphold.logger.debug response.parsed_response
    end
  end
end
