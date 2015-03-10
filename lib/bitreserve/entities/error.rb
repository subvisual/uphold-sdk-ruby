module Bitreserve
  module Entities
    class Error < BaseEntity
      attribute :code
      attribute :error
      attribute :error_description
    end
  end
end
