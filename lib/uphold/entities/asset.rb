# frozen_string_literal: true

module Uphold
  module Entities
    class Asset < BaseEntity
      attribute :currency
      attribute :values
      attribute :totals
    end
  end
end
