require 'spec_helper'

module Uphold
  module API
    describe AuthToken do
      let(:client) { Client.new }

      context '#generate_access_token' do
        it 'generates a personal access token' do
          VCR.use_cassette('pats') do
            token = client.generate_access_token(username: 'example', password: 'Password123', otp: '5960110')

            expect(token).to be_a(Entities::AuthToken)
            expect(token.access_token).to be_a(String)
          end
        end
      end
    end
  end
end
