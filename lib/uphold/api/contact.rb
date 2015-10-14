module Uphold
  module API
    module Contact
      def all_contacts
        request_data = RequestData.new(
          Endpoints::USER_CONTACTS,
          Entities::Contact,
          authorization_header
        )
        Request.perform_with_objects(:get, request_data)
      end

      def find_contact(id: nil)
        request_data = RequestData.new(
          Endpoints::USER_CONTACTS + "/#{id}",
          Entities::Contact,
          authorization_header
        )
        Request.perform_with_object(:get, request_data)
      end

      def create_contact(**args)
        request_data = RequestData.new(
          Endpoints::USER_CONTACTS,
          Entities::Contact,
          authorization_header,
          Uphold::Helpers.camelized_hash(args)
        )

        Request.perform_with_object(:post, request_data)
      end
    end
  end
end
