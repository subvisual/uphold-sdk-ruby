module Uphold
  module Entities
    class BaseEntity
      include Virtus.model

      def self.from_collection(entities, content_range)
        total_size = (content_range && content_range.split('/')[1]) || entities.size
        items = entities.map { |entity| new(entity) }

        PaginatedCollection.new(items, total_size)
      end

      def initialize(attributes = {})
        super(Uphold::Helpers.underscored_hash(attributes))
      end

      class PaginatedCollection < Array
        attr_reader :total_size

        def initialize(items, total_size)
          super(items)
          @total_size = total_size.to_i
        end
      end
    end
  end
end
