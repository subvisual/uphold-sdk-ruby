# frozen_string_literal: true

require 'spec_helper'

module Uphold
  module API
    describe Ticker do
      let(:client) { Uphold::Client.new }

      context '#all_tickers' do
        it 'gets all the tickers' do
          VCR.use_cassette('tickers') do
            tickers = client.all_tickers

            expect(tickers).to be_a(Array)
            expect(tickers.first).to be_a(Entities::Ticker)
            expect(tickers.first.ask).to be_a(String)
          end
        end
      end
    end
  end
end
