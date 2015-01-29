require 'spec_helper'

module Bitreserve
  module API
    describe AuthToken do
      let(:client) { Client.new }

      context '#generate_access_token' do
        it 'generates a personal access token' do
          auth = { username: 'user', password: 'pass', otp: 'otp' }
          allow(Request).to receive(:perform_with_object)

          client.generate_access_token(auth)

          expect(Request).to have_received(:perform_with_object).
            with(:post, anything)
        end
      end
    end
  end
end
