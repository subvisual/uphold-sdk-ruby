module Bitreserve
  module Entities
    class LedgerEntry < BaseEntity
      attribute :type
      attribute :out
      attribute :in
      attribute :created_at
    end
  end
end
