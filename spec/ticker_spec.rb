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
  end
end
