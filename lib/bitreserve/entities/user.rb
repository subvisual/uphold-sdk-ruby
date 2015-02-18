module Bitreserve
  module Entities
    class User < BaseEntity
      attribute :username, String
      attribute :email, String
      attribute :first_name, String
      attribute :last_name, String
      attribute :country, String
      attribute :state, String
      attribute :currencies
      attribute :settings
      attribute :status
      attribute :balances
      attribute :phones, Array[Entities::Phone]
      attribute :cards, Array[Entities::Card]
    end
  end
end
