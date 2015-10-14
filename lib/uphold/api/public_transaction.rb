module Uphold
  module API
    module PublicTransaction
      def all_public_transactions(range: (0..4))
        request_data = RequestData.new(
          Endpoints::PUBLIC_TRANSACTIONS,
          Entities::Transaction,
          authorization_header.merge(pagination_header_for_range(range))
        )
        Request.perform_with_objects(:get, request_data)
      end

      def find_public_transaction(id: '')
        request_data = RequestData.new(
          Endpoints::PUBLIC_TRANSACTIONS + "/#{id}",
          Entities::Transaction,
          authorization_header
        )
        Request.perform_with_object(:get, request_data)
      end
    end
  end
end
