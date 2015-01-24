module Bitreserve
  module Entities
    class BaseEntity
      def initialize(attributes = {})
        instantiate_variables(attributes)
      end

      private

      def instantiate_variables(attributes)
        attributes.each_pair do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end
    end
  end
end
