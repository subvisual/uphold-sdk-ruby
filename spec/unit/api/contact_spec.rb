require 'spec_helper'

module Bitreserve
  module API
    describe Card do
      let(:client) { Bitreserve::Client.new }

      context '#all_contacts' do
        it 'gets all the contacts' do
          request_data = RequestData.new(Endpoints::USER_CONTACTS, Entities::Contact, client.authorization_header)
          allow(Request).to receive(:perform_with_objects)

          client.all_contacts

          expect(Request).to have_received(:perform_with_objects).
            with(:get, request_data)
        end
      end

      context '#find_contact' do
        it 'gets a specific contact' do
          id = '1234'
          request_data = RequestData.new(Endpoints::USER_CONTACTS + "/#{id}", Entities::Contact, client.authorization_header)
          allow(Request).to receive(:perform_with_object)

          client.find_contact(id: id)

          expect(Request).to have_received(:perform_with_object).
            with(:get, request_data)
        end
      end

      context '#create_contact' do
        it 'creates a contact' do
          data = {
            first_name: 'first-name',
            last_name: 'last-name',
            emails: ['fake@email.com'],
            company: 'company-name',
            addresses: ['fake-address-1', 'fake-address-2']
          }
          request_data = RequestData.new(Endpoints::USER_CONTACTS, Entities::Contact, client.authorization_header, Bitreserve::Helpers.camelized_hash(data))
          allow(Request).to receive(:perform_with_object)

          client.create_contact(data)

          expect(Request).to have_received(:perform_with_object).
            with(:post, request_data)
        end
      end
    end
  end
end
