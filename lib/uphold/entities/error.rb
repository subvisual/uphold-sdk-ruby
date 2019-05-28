# frozen_string_literal: true

module Uphold
  module Entities
    class Error < BaseEntity
      attribute :code
      attribute :errors
    end
  end
end
