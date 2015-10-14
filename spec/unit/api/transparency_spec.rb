require 'spec_helper'

module Uphold
  module API
    describe Transparency do
      let(:client) { Client.new }

      context '#statistics' do
        it 'gets all the uphold reserve stats' do
          request_data = RequestData.new(Endpoints::STATS, Entities::Asset, client.authorization_header)
          allow(Request).to receive(:perform_with_objects)

          client.statistics

          expect(Request).to have_received(:perform_with_objects).
            with(:get, request_data)
        end
      end

      context '#ledger' do
        it 'gets all the uphold reserve stats' do
          request_data = RequestData.new(Endpoints::LEDGER, Entities::LedgerEntry, client.authorization_header)
          allow(Request).to receive(:perform_with_objects)

          client.ledger

          expect(Request).to have_received(:perform_with_objects).
            with(:get, request_data)
        end
      end
    end
  end
end
