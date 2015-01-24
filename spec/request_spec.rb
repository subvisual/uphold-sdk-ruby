require 'spec_helper'

module Bitreserve
  describe Request do
    let(:object_class) { double('ObjectClass', new: nil) }
    let(:request) { spy('request') }

    context '.perform_with_object' do
      it 'makes the correct call for a GET' do
        allow(Request).to receive(:new).and_return(request)

        Request.perform_with_object(:get, anything, object_class, anything)

        expect(request).to have_received(:get)
      end

      it 'makes the correct call for a POST' do
        allow(Request).to receive(:new).and_return(request)

        Request.perform_with_object(:post, anything, object_class, anything)

        expect(request).to have_received(:post)
      end

      it 'makes the actual call' do
        url = '/some-url'
        client = instance_double('Bitreserve::Client')
        stub_request(:get, Request.base_uri + url)
        allow(Request).to receive(:get).and_call_original
        allow(client).to receive(:bearer_token?)

        Request.perform_with_object(:get, url, object_class, client)

        expect(Request).to have_received(:get).with(url)
      end
    end
  end
end
