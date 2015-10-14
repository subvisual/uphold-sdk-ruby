require 'spec_helper'

module Uphold
  module API
    describe PrivateTransaction do
      let(:client) { Client.new }

      context '#commit_transaction' do
        it 'it creates and commits a transaction' do
          card_id = 'a4feff08-2977-40f8-a339-4f546ae5c7e2'
          created_transaction = nil

          VCR.use_cassette('me/transactions/create') do
            destination = 'a0e20123-47c8-4784-9e71-0defb34d18a7'
            created_transaction = client.create_transaction(card_id: card_id, currency: 'BTC', amount: 0.0001, destination: destination)

            expect(created_transaction).to be_a(Entities::Transaction)
            expect(created_transaction.id).to be_a(String)
            expect(created_transaction.status).to eq 'pending'
          end

          VCR.use_cassette('me/transactions/commit') do
            transaction = client.commit_transaction(card_id: card_id, transaction_id: created_transaction.id)

            expect(transaction).to be_a(Entities::Transaction)
            expect(transaction.id).to eq created_transaction.id
            expect(transaction.status).to eq 'completed'
          end
        end
      end

      context '#cancel_transaction' do
        it 'cancels a transaction' do
          card_id = 'a4feff08-2977-40f8-a339-4f546ae5c7e2'
          waiting_transaction = create_waiting_transaction(card_id, :cancel)

          VCR.use_cassette('me/transactions/cancel') do
            transaction = client.cancel_transaction(card_id: card_id, transaction_id: waiting_transaction.id)

            expect(transaction).to be_a(Entities::Transaction)
            expect(transaction.id).to eq waiting_transaction.id
            expect(transaction.status).to eq 'cancelled'
          end
        end
      end

      context '#resend_transaction' do
        it 'resends a transaction' do
          card_id = 'a4feff08-2977-40f8-a339-4f546ae5c7e2'
          waiting_transaction = create_waiting_transaction(card_id, :resend)

          VCR.use_cassette('me/transactions/resend') do
            transaction = client.resend_transaction(card_id: card_id, transaction_id: waiting_transaction.id)

            expect(transaction).to be_a(Entities::Transaction)
            expect(transaction.id).to eq waiting_transaction.id
            expect(transaction.status).to eq 'waiting'
          end
        end
      end

      def create_waiting_transaction(card_id, action)
        VCR.use_cassette("me/transactions/create_waiting_#{action}") do
          destination = 'non-user@example.com'
          created_transaction = client.create_transaction(card_id: card_id, currency: 'BTC', amount: 0.0001, destination: destination)
          waiting_transaction = client.commit_transaction(card_id: card_id, transaction_id: created_transaction.id)

          expect(waiting_transaction.status).to eq 'waiting'
          waiting_transaction
        end
      end
    end
  end
end
