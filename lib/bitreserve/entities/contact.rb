module Bitreserve
  module Entities
    class Contact < BaseEntity
      attr_reader :id, :first_name, :last_name, :company, :emails, :addresses, :name
    end
  end
end
