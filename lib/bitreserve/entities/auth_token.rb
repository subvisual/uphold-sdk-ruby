module Bitreserve
  module Entities
    class AuthToken < BaseEntity
      attr_reader :access_token, :description, :expires
    end
  end
end
