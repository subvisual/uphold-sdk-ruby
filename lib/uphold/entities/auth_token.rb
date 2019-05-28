# frozen_string_literal: true

module Uphold
  module Entities
    class AuthToken < BaseEntity
      attribute :access_token
      attribute :description
      attribute :expires, DateTime
    end
  end
end
