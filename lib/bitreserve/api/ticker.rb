module Bitreserve
  module API
    module Ticker
      def all_tickers
        Request.perform_with_objects(:get,
          Bitreserve::Endpoints::TICKER,
          Bitreserve::Entities::Ticker,
          self
        )
      end

      def find_ticker(currency: nil)
        Request.perform_with_objects(:get,
          Bitreserve::Endpoints::TICKER + "/#{currency}",
          Bitreserve::Entities::Ticker,
          self
        )
      end
    end
  end
end
