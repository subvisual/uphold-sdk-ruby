# frozen_string_literal: true

require 'spec_helper'

module Uphold
  describe Client do
    it 'takes a token on initialization' do
      token = 'x'

      client = Client.new(token: token)

      expect(client.bearer_token).to eq token
    end

    it 'gets the token from the ENV if none is provided' do
      token = 'x'

      with_modified_env UPHOLD_AUTH_TOKEN: token do
        client = Client.new

        expect(client.bearer_token).to eq token
      end
    end

    it 'uses the production api by default' do
      expect(Uphold.api_base).to eq Uphold::Options::API_BASE
    end

    it 'uses the sandbox api when asked to' do
      Uphold.sandbox = true
      expect(Uphold.api_base).to eq Uphold::Options::SANDBOX_API_BASE
      Uphold.sandbox = false
    end
  end
end
