require 'bitreserve/api/endpoints'
require 'bitreserve/api/ticker'
require 'bitreserve/api/card'

module Bitreserve
  module API
    include API::Ticker
    include API::Card
  end
end
