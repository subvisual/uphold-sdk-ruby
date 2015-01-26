module Bitreserve
  module API
    module Ticker
      def all_tickers
        request_data = Bitreserve::RequestData.new(
          Bitreserve::Endpoints::TICKER,
          Bitreserve::Entities::Ticker,
          authorization_header
        )
        Request.perform_with_objects(:get, request_data)
      end

      def find_ticker(currency: nil)
        request_data = Bitreserve::RequestData.new(
          Bitreserve::Endpoints::TICKER + "/#{currency}",
          Bitreserve::Entities::Ticker,
          authorization_header
        )
        Request.perform_with_objects(:get, request_data)
      end
    end
  end
end
