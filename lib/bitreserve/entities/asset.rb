module Bitreserve
  module Entities
    class Asset < BaseEntity
      attr_reader :currency, :values, :totals
    end
  end
end
