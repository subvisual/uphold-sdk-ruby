# frozen_string_literal: true

require 'spec_helper'

module Uphold
  module API
    describe User do
      let(:client) { Uphold::Client.new }

      context '#me' do
        it 'gets my personal information' do
          request_data = RequestData.new(Endpoints::USER, Entities::User, client.authorization_header)
          allow(Request).to receive(:perform_with_object)

          client.me

          expect(Request).to have_received(:perform_with_object).
            with(:get, request_data)
        end
      end

      context '#phones' do
        it 'gets my associated phone numbers' do
          request_data = RequestData.new(Endpoints::USER_PHONES, Entities::Phone, client.authorization_header)
          allow(Request).to receive(:perform_with_objects)

          client.phones

          expect(Request).to have_received(:perform_with_objects).
            with(:get, request_data)
        end
      end
    end
  end
end
