# frozen_string_literal: true

require 'spec_helper'

module Uphold
  module API
    describe Card do
      let(:client) { Client.new }

      context '#all_cards' do
        it 'gets all the cards' do
          VCR.use_cassette('me/cards') do
            cards = client.all_cards

            expect(cards).to be_a(Array)
            expect(cards.first).to be_a(Entities::Card)
            expect(cards.first.id).to be_a(String)
          end
        end
      end

      context '#find_card' do
        it 'gets a specific card' do
          VCR.use_cassette('me/card') do
            id = 'd9cfb5ec-27b3-427a-8ee6-084a7c6b5d2a'

            card = client.find_card(id: id)

            expect(card).to be_a(Entities::Card)
            expect(card.id).to eq id
          end
        end
      end

      context '#create_card' do
        it 'creates a card' do
          VCR.use_cassette('me/created_card') do
            data = { label: 'New card', currency: 'EUR' }

            card = client.create_card(data)

            expect(card).to be_a(Entities::Card)
            expect(card.label).to eq data[:label]
          end
        end
      end
    end
  end
end
