module Bitreserve
  module API
    module User
      def me
        request_data = RequestData.new(
          Endpoints::USER,
          Entities::User,
          authorization_header
        )
        Request.perform_with_object(:get, request_data)
      end

      def phones
        request_data = RequestData.new(
          Endpoints::USER_PHONES,
          Entities::Phone,
          authorization_header
        )
        Request.perform_with_objects(:get, request_data)
      end
    end
  end
end
