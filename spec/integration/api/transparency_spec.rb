require 'spec_helper'

module Bitreserve
  module API
    describe Transparency do
      let(:client) { Bitreserve::Client.new }

      context '#statistics' do
        it 'gets all the tickers' do
          VCR.use_cassette('transparency') do
            assets = client.statistics

            expect(assets).to be_a(Array)
            expect(assets.first).to be_a(Entities::Asset)
            expect(assets.first.currency).to be_a(String)
          end
        end
      end
    end
  end
end
