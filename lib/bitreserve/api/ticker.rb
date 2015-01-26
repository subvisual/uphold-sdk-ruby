module Bitreserve
  module API
    module Ticker
      def all_tickers
        request_data = RequestData.new(
          Endpoints::TICKER,
          Entities::Ticker,
          authorization_header
        )
        Request.perform_with_objects(:get, request_data)
      end

      def find_ticker(currency: nil)
        request_data = RequestData.new(
          Endpoints::TICKER + "/#{currency}",
          Entities::Ticker,
          authorization_header
        )
        Request.perform_with_objects(:get, request_data)
      end
    end
  end
end
