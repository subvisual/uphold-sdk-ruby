# frozen_string_literal: true

module Uphold
  module Entities
    class Contact < BaseEntity
      attribute :id
      attribute :first_name
      attribute :last_name
      attribute :company
      attribute :emails
      attribute :addresses
      attribute :name
    end
  end
end
