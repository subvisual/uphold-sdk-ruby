module Bitreserve
  module API
    module AuthToken
      def generate_access_token(username: '', password: '')
        request_data = Bitreserve::RequestData.new(
          Endpoints::AUTH,
          Entities::AuthToken,
          authorization_header,
          nil,
          username: username, password: password
        )
        AuthRequest.perform_with_object(:post, request_data)
      end
    end
  end
end
