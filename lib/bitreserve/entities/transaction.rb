module Bitreserve
  module Entities
    class Transaction < BaseEntity
      attribute :id
      attribute :message
      attribute :status
      attribute :type
      attribute :refunded_by_id
      attribute :created_at, DateTime
      attribute :quoted_at, DateTime
      attribute :denominatio
      attribute :origin
      attribute :destination
      attribute :params
    end
  end
end
