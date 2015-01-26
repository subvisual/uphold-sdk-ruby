module Bitreserve
  module Entities
    class Transaction < BaseEntity
      attr_reader :id, :message, :status, :type, :refunded_by_id, :created_at, :denomination, :origin, :destination, :params, :quoted_at
    end
  end
end
