# frozen_string_literal: true

module Uphold
  module Entities
    class Transaction < BaseEntity
      attribute :id
      attribute :message
      attribute :status
      attribute :type
      attribute :refunded_by_id
      attribute :created_at, DateTime
      attribute :quoted_at, DateTime
      attribute :denomination
      attribute :origin
      attribute :destination
      attribute :params
    end
  end
end
