module Bitreserve
  class Ticker
    def self.all
      Request.perform(:get, Endpoints::TICKER)
    end
  end
end
