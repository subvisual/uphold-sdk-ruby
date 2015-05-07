module Bitreserve
  module Options
    attr_reader :options
    API_BASE = 'https://api.bitreserve.org'
    SANDBOX_API_BASE = 'https://api-sandbox.bitreserve.org'

    def bearer_token?
      !bearer_token.nil?
    end

    def bearer_token
      @bearer_token ||= (options[:token] || ENV['BITRESERVE_AUTH_TOKEN'])
    end

    def authorization_header
      return {} unless bearer_token?

      { 'Authorization' => "Bearer #{bearer_token}" }
    end
  end
end
