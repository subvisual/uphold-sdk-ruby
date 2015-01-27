require 'spec_helper'

module Bitreserve
  module API
    describe Ticker do
      let(:client) { Bitreserve::Client.new }

      context '#all_tickers' do
        it 'gets all the tickers' do
          request_data = Bitreserve::RequestData.new(Endpoints::TICKER, Bitreserve::Entities::Ticker, client.authorization_header)
          allow(Request).to receive(:perform_with_objects)

          client.all_tickers

          expect(Request).to have_received(:perform_with_objects).
            with(:get, request_data)
        end
      end

      context '#find_ticker' do
        it 'gets a specific ticker' do
          currency = 'USD'
          request_data = Bitreserve::RequestData.new(Endpoints::TICKER + "/#{currency}", Bitreserve::Entities::Ticker, client.authorization_header)
          allow(Request).to receive(:perform_with_objects)

          client.find_ticker(currency: currency)

          expect(Request).to have_received(:perform_with_objects).
            with(:get, request_data)
        end
      end
    end
  end
end
