module Bitreserve
  module API
    module Transparency
      def statistics
        request_data = RequestData.new(Endpoints::STATS, Entities::Asset, authorization_header)
        Request.perform_with_objects(:get, request_data)
      end
    end
  end
end
