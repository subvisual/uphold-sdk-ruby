require 'spec_helper'

module Bitreserve
  shared_examples 'perform request method' do |method_name|
    let(:object_class) { double('ObjectClass', new: nil, from_collection: nil) }
    let(:request) { spy('request') }
    let(:client) { Bitreserve::Client.new }

    context ".#{method_name}" do
      it 'makes the correct call for a GET' do
        allow(Request).to receive(:new).and_return(request)

        Request.public_send(method_name, :get, request_data)

        expect(request).to have_received(:get)
      end

      it 'makes the correct call for a POST' do
        allow(Request).to receive(:new).and_return(request)

        Request.public_send(method_name, :post, request_data)

        expect(request).to have_received(:post)
      end

      it 'makes the actual GET call' do
        url = '/some-url'
        WebMockHelpers.bitreserve_stub_request(:get, url)
        allow(Request).to receive(:get).and_call_original

        Request.public_send(method_name, :get, request_data(url, client))

        expect(Request).to have_received(:get).with(url)
      end

      it 'makes the actual POST call' do
        url = '/some-url'
        data = { key: 'value' }
        WebMockHelpers.bitreserve_stub_request(:post, url)
        allow(Request).to receive(:post).and_call_original

        Request.public_send(method_name, :post, request_data(url, client, data))

        expect(Request).to have_received(:post).with(url, body: data)
      end
    end

    def request_data(url = anything, client = nil, payload = nil)
      client ||= double('Client', authorization_header: {})
      Bitreserve::RequestData.new(url, object_class, client.authorization_header, payload)
    end
  end

  describe Request do
    include_examples 'perform request method', :perform_with_object
    include_examples 'perform request method', :perform_with_objects
  end
end
