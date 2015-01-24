module Bitreserve
  module Entities
    class Card < BaseEntity
      attr_reader :id, :address, :addresses, :label, :currency, :balance,
        :available, :lastTransactionAt, :position
    end
  end
end
