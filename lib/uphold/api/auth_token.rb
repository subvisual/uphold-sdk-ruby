require 'base64'

module Uphold
  module API
    module AuthToken
      def generate_access_token(username: '', password: '', otp: '')
        request_data = Uphold::RequestData.new(
          Endpoints::AUTH,
          Entities::AuthToken,
          {
            'X-Uphold-OTP' => otp,
            'X-Bitreserve-OTP' => otp,
            'Authorization' => 'Basic ' + Base64.encode64("#{username}:#{password}")
          },
          description: 'Uphold ruby'
        )
        Request.perform_with_object(:post, request_data)
      end
    end
  end
end
