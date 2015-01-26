require 'spec_helper'

module Bitreserve
  module API
    describe User do
      let(:client) { Bitreserve::Client.new }

      context '#me' do
        it 'gets my personal information' do
          allow(Request).to receive(:perform_with_object)

          client.me

          expect(Request).to have_received(:perform_with_object).
            with(:get, Endpoints::USER, Entities::User, client)
        end
      end

      context '#phones' do
        it 'gets my associated phone numbers' do
          allow(Request).to receive(:perform_with_objects)

          client.phones

          expect(Request).to have_received(:perform_with_objects).
            with(:get, Endpoints::USER_PHONES, Entities::Phone, client)
        end
      end
    end
  end
end
