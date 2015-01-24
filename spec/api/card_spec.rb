require 'spec_helper'

module Bitreserve
  module API
    describe Card do
      let(:client) { Bitreserve::Client.new }

      context '#all_cards' do
        it 'gets all the cards' do
          allow(Request).to receive(:perform_with_objects)

          client.all_cards

          expect(Request).to have_received(:perform_with_objects).
            with(:get, Endpoints::CARD, Bitreserve::Entities::Card, client)
        end
      end
    end
  end
end
