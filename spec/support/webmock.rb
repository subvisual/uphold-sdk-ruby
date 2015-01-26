require 'webmock/rspec'

WebMock.disable_net_connect!(allow: 'codeclimate.com')

module WebMockHelpers
  def self.bitreserve_stub_request(method, url, response = [])
    WebMock::API.stub_request(method, Bitreserve::Request.base_uri + url).
      to_return(body: response.to_json, headers: { 'Content-Type' =>  'application/json' })
  end
end
