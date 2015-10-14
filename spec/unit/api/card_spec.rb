require 'spec_helper'

module Uphold
  module API
    describe Card do
      let(:client) { Client.new }

      context '#all_cards' do
        it 'gets all the cards' do
          request_data = RequestData.new(Endpoints::CARD, Entities::Card, client.authorization_header)
          allow(Request).to receive(:perform_with_objects)

          client.all_cards

          expect(Request).to have_received(:perform_with_objects).
            with(:get, request_data)
        end
      end

      context '#find_card' do
        it 'gets a specific card' do
          id = '1234'
          request_data = RequestData.new(Endpoints::CARD + "/#{id}", Entities::Card, client.authorization_header)
          allow(Request).to receive(:perform_with_object)

          client.find_card(id: id)

          expect(Request).to have_received(:perform_with_object).
            with(:get, request_data)
        end
      end

      context '#create_card' do
        it 'creates a card' do
          data = { label: 'New card', currency: 'EUR' }
          request_data = RequestData.new(Endpoints::CARD, Entities::Card, client.authorization_header, data)
          allow(Request).to receive(:perform_with_object)

          client.create_card(data)

          expect(Request).to have_received(:perform_with_object).
            with(:post, request_data)
        end
      end
    end
  end
end
