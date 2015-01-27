require 'webmock/rspec'
require 'uri'

WebMock.disable_net_connect!(allow: 'codeclimate.com')

module WebMockHelpers
  def self.bitreserve_stub_request(method, url, response = [])
    WebMock::API.stub_request(method, Bitreserve::Request.base_uri + url).
      to_return(body: response.to_json, headers: { 'Content-Type' =>  'application/json' })
  end

  def self.bitreserve_stub_request_with_auth(method, url, response = [], auth = nil)
    new_url = generate_auth_url(url, auth)
    WebMock::API.stub_request(method, new_url).
      to_return(body: response.to_json, headers: { 'Content-Type' =>  'application/json' })
  end

  private

  def self.generate_auth_url(url, auth)
    uri = URI.parse(Bitreserve::AuthRequest.base_uri)
    uri.scheme + '://' + auth[:username] + ':' + auth[:password] + '@' + uri.host + url
  end
end
