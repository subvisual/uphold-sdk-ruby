require 'bitreserve/api/auth_token'
require 'bitreserve/api/card'
require 'bitreserve/api/contact'
require 'bitreserve/api/endpoints'
require 'bitreserve/api/private_transaction'
require 'bitreserve/api/public_transaction'
require 'bitreserve/api/ticker'
require 'bitreserve/api/transparency'
require 'bitreserve/api/user'

module Bitreserve
  module API
    include API::AuthToken
    include API::Card
    include API::Contact
    include API::PrivateTransaction
    include API::PublicTransaction
    include API::Ticker
    include API::Transparency
    include API::User
  end
end
