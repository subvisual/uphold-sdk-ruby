module Bitreserve
  module Entities
    class AuthToken < BaseEntity
      attribute :access_token
      attribute :description
      attribute :expires, DateTime
    end
  end
end
