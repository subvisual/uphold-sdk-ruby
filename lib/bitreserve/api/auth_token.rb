require 'base64'

module Bitreserve
  module API
    module AuthToken
      def generate_access_token(username: '', password: '', otp: '')
        request_data = Bitreserve::RequestData.new(
          Endpoints::AUTH,
          Entities::AuthToken,
          { 'X-Bitreserve-OTP' => otp, 'Authorization' => 'Basic ' + Base64.encode64("#{username}:#{password}") },
          description: 'Bitreserve ruby'
        )
        Request.perform_with_object(:post, request_data)
      end
    end
  end
end
