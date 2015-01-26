module Bitreserve
  module Entities
    class Phone < BaseEntity
      attr_reader :id, :verified, :primary, :e164_masked, :national_masked, :international_masked
    end
  end
end
