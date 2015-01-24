module Bitreserve
  module Entities
    class Ticker < BaseEntity
      attr_reader :ask, :bid, :currency, :pair
    end
  end
end
