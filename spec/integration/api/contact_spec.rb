require 'spec_helper'

module Bitreserve
  module API
    describe Contact do
      let(:client) { Bitreserve::Client.new }

      context '#all_contacts' do
        it 'gets all the contacts' do
          VCR.use_cassette('me/contacts') do
            contacts = client.all_contacts

            expect(contacts).to be_a(Array)
            expect(contacts.first).to be_a(Entities::Contact)
            expect(contacts.first.id).to be_a(String)
          end
        end
      end

      context '#find_contact' do
        it 'gets a specific contact' do
          VCR.use_cassette('me/contact') do
            id = '6a0fc9d7-605b-43a3-8675-f1188ab2e005'

            contact = client.find_contact(id: id)

            expect(contact).to be_a(Entities::Contact)
            expect(contact.id).to eq id
          end
        end
      end

      context '#create_contact' do
        it 'creates a contact' do
          VCR.use_cassette('me/created_contact') do
            data = {
              first_name: 'first-name',
              last_name: 'last-name',
              emails: ['fake@email.com'],
              company: 'company-name',
              addresses: []
            }

            contact = client.create_contact(data)

            expect(contact).to be_a(Entities::Contact)
            expect(contact.first_name).to eq(data[:first_name])
          end
        end
      end
    end
  end
end
