module Bitreserve
  module Entities
    class BaseEntity
      def self.from_collection(entities)
        entities.map do |entity|
          new(entity)
        end
      end

      def initialize(attributes = {})
        instantiate_variables(attributes)
      end

      private

      def instantiate_variables(attributes)
        attributes.each_pair do |key, value|
          instance_variable_set(instance_variable_name(key), value)
        end
      end

      def instance_variable_name(key)
        underscored_key = key.to_s.gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase
        "@#{underscored_key}"
      end
    end
  end
end
