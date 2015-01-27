require 'spec_helper'

module Bitreserve
  describe Client do
    it 'takes a token on initialization' do
      token = 'x'

      client = Client.new(token: token)

      expect(client.bearer_token).to eq token
    end

    it 'gets the token from the ENV if none is provided' do
      token = 'x'

      with_modified_env BITRESERVE_AUTH_TOKEN: token do
        client = Client.new

        expect(client.bearer_token).to eq token
      end
    end
  end
end
