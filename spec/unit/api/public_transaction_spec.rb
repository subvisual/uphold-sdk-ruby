require 'spec_helper'

module Bitreserve
  module API
    describe PublicTransaction do
      let(:client) { Bitreserve::Client.new }

      context '#all_public_transactions' do
        it 'gets all public transactions' do
          request_data = RequestData.new(Endpoints::PUBLIC_TRANSACTIONS, Entities::Transaction, client.authorization_header.merge(client.pagination_header_for_range(0..4)))
          allow(Request).to receive(:perform_with_objects)

          client.all_public_transactions

          expect(Request).to have_received(:perform_with_objects).
            with(:get, request_data)
        end
      end

      context '#find_public_transaction' do
        it 'gets a public transaction' do
          id = '1234'
          request_data = RequestData.new(Endpoints::PUBLIC_TRANSACTIONS + "/#{id}", Entities::Transaction, client.authorization_header)
          allow(Request).to receive(:perform_with_object)

          client.find_public_transaction(id: id)

          expect(Request).to have_received(:perform_with_object).
            with(:get, request_data)
        end
      end
    end
  end
end
