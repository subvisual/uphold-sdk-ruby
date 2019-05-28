# frozen_string_literal: true

module Uphold
  module API
    module Transparency
      def statistics
        request_data = RequestData.new(Endpoints::STATS, Entities::Asset, authorization_header)
        Request.perform_with_objects(:get, request_data)
      end

      def ledger
        request_data = RequestData.new(Endpoints::LEDGER, Entities::LedgerEntry, authorization_header)
        Request.perform_with_objects(:get, request_data)
      end
    end
  end
end
