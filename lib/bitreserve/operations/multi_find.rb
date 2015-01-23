module Bitreserve
  module Operations
    module MultiFind
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def find(id)
          data = Request.perform(:get, Bitreserve::Endpoints.const_get("#{name.split('::').last.upcase}") + "/#{id}")
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
