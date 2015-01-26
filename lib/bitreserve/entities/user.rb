module Bitreserve
  module Entities
    class User < BaseEntity
      attr_reader :username, :email, :first_name, :last_name, :country, :state, :currencies, :settings, :status, :balances

      def phones
        @_phones ||= Entities::Phone.from_collection(@phones)
      end

      def cards
        @_cards ||= Entities::Card.from_collection(@cards)
      end

      def transactions
        @_transactions ||= Entities::Transaction.from_collection(@transaction)
      end
    end
  end
end
