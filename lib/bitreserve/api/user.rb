module Bitreserve
  module API
    module User
      def me
        Request.perform_with_object(:get,
          Endpoints::USER,
          Entities::User,
          self)
      end

      def phones
        Request.perform_with_objects(:get,
          Endpoints::USER_PHONES,
          Entities::Phone,
          self)
      end
    end
  end
end
