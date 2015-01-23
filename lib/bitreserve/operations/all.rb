module Bitreserve
  module Operations
    module All
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def all
          data = Request.perform(:get, Bitreserve::Endpoints.const_get("#{name.split('::').last.upcase}"))
          parse_objects data
        end

        private

        def parse_objects(data)
          return [] unless data

          data.map do |object_data|
            new(object_data)
          end
        end
      end
    end
  end
end
