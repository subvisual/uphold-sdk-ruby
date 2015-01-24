require 'bitreserve/api'

module Bitreserve
  class Client
    include Bitreserve::API
    attr_reader :bearer_token

    def initialize(token: ENV['BITRESERVE_AUTH_TOKEN'])
      @bearer_token = token
    end

    def bearer_token?
      !bearer_token.nil?
    end
  end
end
