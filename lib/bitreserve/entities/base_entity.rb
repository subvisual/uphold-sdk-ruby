module Bitreserve
  module Entities
    class BaseEntity
      include Virtus.model

      def self.from_collection(entities)
        entities.map do |entity|
          new(entity)
        end
      end

      def initialize(attributes = {})
        super(Bitreserve::Helpers.underscored_hash(attributes))
      end
    end
  end
end
