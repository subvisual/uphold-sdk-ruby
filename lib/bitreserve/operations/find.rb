module Bitreserve
  module Operations
    module Find
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def find(id)
          data = Request.perform(:get, Bitreserve::Endpoints.const_get("#{name.split('::').last.upcase}") + "/#{id}")
          new(data || {})
        end
      end
    end
  end
end
