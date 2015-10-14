module Uphold
  module API
    module Card
      def all_cards
        Request.perform_with_objects(:get, cards_request_data)
      end

      def find_card(id: nil)
        Request.perform_with_object(:get, card_request_data(id))
      end

      def create_card(label: nil, currency: nil)
        Request.perform_with_object(:post, cards_request_data(label: label, currency: currency))
      end

      private

      def cards_request_data(payload = nil)
        RequestData.new(
          Endpoints::CARD,
          Entities::Card,
          authorization_header,
          payload
        )
      end

      def card_request_data(id)
        RequestData.new(
          Endpoints::CARD + "/#{id}",
          Entities::Card,
          authorization_header
        )
      end
    end
  end
end
