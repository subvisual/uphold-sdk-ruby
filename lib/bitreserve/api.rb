require 'bitreserve/api/endpoints'
require 'bitreserve/api/ticker'
require 'bitreserve/api/card'

module Bitreserve
  module API
    include Bitreserve::API::Ticker
    include Bitreserve::API::Card
  end
end
