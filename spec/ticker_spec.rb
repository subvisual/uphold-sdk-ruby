require 'spec_helper'

module Bitreserve
  describe Ticker do
    context '.all' do
      it 'gets all the tickers' do
        allow(Request).to receive(:perform)

        Ticker.all

        expect(Request).to have_received(:perform).with(:get, Endpoints::TICKER)
      end
    end

    context '.find' do
      it 'gets a specific ticker' do
        allow(Request).to receive(:perform)
        currency = 'USD'

        Ticker.find(currency)

        expect(Request).to have_received(:perform).with(:get, Endpoints::TICKER + "/#{currency}")
      end
    end
  end
end
