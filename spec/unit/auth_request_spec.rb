require 'spec_helper'

module Bitreserve
  shared_examples 'perform auth request method' do |method_name|
    let(:object_class) { double('ObjectClass', new: nil, from_collection: nil) }
    let(:request) { spy('request') }
    let(:client) { Bitreserve::Client.new }

    context ".#{method_name}" do
      it 'makes a call with basic auth' do
        url = '/some-url'
        auth = { username: 'user', password: 'pass' }
        WebMockHelpers.bitreserve_stub_request_with_auth(:get, url, [], auth)
        allow(AuthRequest).to receive(:get).and_call_original

        AuthRequest.public_send(method_name, :get, request_data(url, client, nil, auth))

        expect(AuthRequest).to have_received(:get).with(url, basic_auth: auth, headers: client.authorization_header)
      end
    end

    def request_data(url = anything, client = nil, payload = nil, auth = nil)
      client ||= double('Client', authorization_header: {})
      RequestData.new(url, object_class, client.authorization_header, payload, auth)
    end
  end

  describe AuthRequest do
    include_examples 'perform auth request method', :perform_with_object
    include_examples 'perform auth request method', :perform_with_objects
  end
end
