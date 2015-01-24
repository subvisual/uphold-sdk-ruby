require 'spec_helper'

module Bitreserve
  module API
    describe Ticker do
      let(:client) { Bitreserve::Client.new }

      context '#all_tickers' do
        it 'gets all the tickers' do
          allow(Request).to receive(:perform_with_objects)

          client.all_tickers

          expect(Request).to have_received(:perform_with_objects).
            with(:get, Endpoints::TICKER, Bitreserve::Entities::Ticker, client)
        end
      end

      context '#find_ticker' do
        it 'gets a specific ticker' do
          allow(Request).to receive(:perform_with_objects)
          currency = 'USD'

          client.find_ticker(currency: currency)

          expect(Request).to have_received(:perform_with_objects).
            with(:get, Endpoints::TICKER + "/#{currency}", Bitreserve::Entities::Ticker, client)
        end
      end
    end
  end
end
