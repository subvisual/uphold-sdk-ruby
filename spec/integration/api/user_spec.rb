# frozen_string_literal: true

require 'spec_helper'

module Uphold
  module API
    describe User do
      let(:client) { Uphold::Client.new }

      context '#me' do
        it 'gets my personal information' do
          VCR.use_cassette('me') do
            me = client.me

            expect(me).to be_a(Entities::User)
            expect(me.email).to be_a(String)
          end
        end
      end

      context '#phones' do
        it 'gets my associated phone numbers' do
          VCR.use_cassette('me/phones') do
            phones = client.phones

            expect(phones).to be_a(Array)
            expect(phones.first).to be_a(Entities::Phone)
            expect(phones.first.id).to be_a(String)
          end
        end
      end
    end
  end
end
