module Bitreserve
  module Entities
    class Asset < BaseEntity
      attribute :currency
      attribute :values
      attribute :totals
    end
  end
end
