module Bitreserve
  module Entities
    class Phone < BaseEntity
      attribute :id
      attribute :verified, Boolean
      attribute :primary, Boolean
      attribute :e164_masked
      attribute :national_masked
      attribute :international_masked
    end
  end
end
