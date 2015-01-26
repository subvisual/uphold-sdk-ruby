module Bitreserve
  module Entities
    class Transaction < BaseEntity
      attr_reader :id, :message, :status, :refunded_by_id, :created_at, :denomination, :origin, :destination, :params
    end
  end
end
