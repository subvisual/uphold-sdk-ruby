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

    it 'uses the production api by default' do
      expect(Bitreserve.api_base).to eq Bitreserve::Options::API_BASE
    end

    it 'uses the sandbox api when asked to' do
      Bitreserve.sandbox = true
      expect(Bitreserve.api_base).to eq Bitreserve::Options::SANDBOX_API_BASE
      Bitreserve.sandbox = false
    end
  end
end
