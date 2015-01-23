module Bitreserve
  class Ticker < BaseEntity
    include Bitreserve::Operations::All
    include Bitreserve::Operations::MultiFind

    attr_reader :ask, :bid, :currency, :pair
  end
end
