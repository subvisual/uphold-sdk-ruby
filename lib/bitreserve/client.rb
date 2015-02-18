require 'bitreserve/api'
require 'bitreserve/pagination'

module Bitreserve
  class Client
    include Pagination
    include API
    attr_reader :bearer_token

    def initialize(token: ENV['BITRESERVE_AUTH_TOKEN'])
      @bearer_token = token
    end

    def bearer_token?
      !bearer_token.nil?
    end

    def authorization_header
      return {} unless bearer_token?

      { 'Authorization' => "Bearer #{bearer_token}" }
    end
  end
end
