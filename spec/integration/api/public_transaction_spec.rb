require 'spec_helper'

module Bitreserve
  module API
    describe PublicTransaction do
      let(:client) { Client.new }

      context '#all_public_transactions' do
        it 'gets all public transactions' do
          VCR.use_cassette('reserve/transactions') do
            transactions = client.all_public_transactions

            expect(transactions).to be_a(Array)
            expect(transactions.total_size).to eq 2
            expect(transactions.first).to be_a(Entities::Transaction)
            expect(transactions.first.id).to be_a(String)
          end
        end
      end

      context '#find_public_transaction' do
        it 'gets a public transaction' do
          VCR.use_cassette('reserve/transaction') do
            id = 'a97bb994-6e24-4a89-b653-e0a6d0bcf634'

            transaction = client.find_public_transaction(id: id)

            expect(transaction).to be_a(Entities::Transaction)
            expect(transaction.id).to eq id
          end
        end
      end
    end
  end
end
