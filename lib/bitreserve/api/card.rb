module Bitreserve
  module API
    module Card
      def all_cards
        Request.perform_with_objects(:get,
          Bitreserve::Endpoints::CARD,
          Bitreserve::Entities::Card,
          self
        )
      end
    end
  end
end
