# frozen_string_literal: true

module Uphold
  module Options
    attr_reader :options
    API_BASE = 'https://api.uphold.com'
    SANDBOX_API_BASE = 'https://api-sandbox.uphold.com'

    def bearer_token?
      !bearer_token.nil?
    end

    def bearer_token
      @bearer_token ||= begin
        options[:token] ||
          ENV['UPHOLD_AUTH_TOKEN'] ||
          ENV['BITRESERVE_AUTH_TOKEN']
      end
    end

    def authorization_header
      return {} unless bearer_token?

      { 'Authorization' => "Bearer #{bearer_token}" }
    end
  end
end
