require 'bitreserve/api/endpoints'
require 'bitreserve/api/ticker'
require 'bitreserve/api/card'
require 'bitreserve/api/user'

module Bitreserve
  module API
    include API::Ticker
    include API::Card
    include API::User
  end
end
