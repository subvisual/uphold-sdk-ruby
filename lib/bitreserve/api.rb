require 'bitreserve/api/auth_token'
require 'bitreserve/api/card'
require 'bitreserve/api/contact'
require 'bitreserve/api/endpoints'
require 'bitreserve/api/ticker'
require 'bitreserve/api/transaction'
require 'bitreserve/api/transparency'
require 'bitreserve/api/user'

module Bitreserve
  module API
    include API::AuthToken
    include API::Card
    include API::Contact
    include API::Ticker
    include API::Transaction
    include API::Transparency
    include API::User
  end
end
