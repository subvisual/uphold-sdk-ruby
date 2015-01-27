require 'spec_helper'

module Bitreserve
  module API
    describe Transparency do
      let(:client) { Client.new }

      context '#statistics' do
        it 'gets all the bitreserve reserve stats' do
          request_data = RequestData.new(Endpoints::STATS, Entities::Asset, client.authorization_header)
          allow(Request).to receive(:perform_with_objects)

          client.statistics

          expect(Request).to have_received(:perform_with_objects).
            with(:get, request_data)
        end
      end
    end
  end
end
