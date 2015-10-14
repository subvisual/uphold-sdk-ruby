module Uphold
  module API
    module PrivateTransaction
      def create_transaction(card_id: nil, currency: nil, amount: 0, destination: nil)
        request_data = RequestData.new(
          Endpoints.with_placeholders(Endpoints::CARD_PRIVATE_TRANSACTIONS, ':card' => card_id),
          Entities::Transaction,
          authorization_header,
          card_id: card_id, denomination: { currency: currency, amount: amount }, destination: destination
        )
        Request.perform_with_object(:post, request_data)
      end

      def commit_transaction(card_id: nil, transaction_id: nil)
        request_data = transaction_request_data(Endpoints::COMMIT_TRANSACTION, card_id, transaction_id)
        Request.perform_with_object(:post, request_data)
      end

      def cancel_transaction(card_id: nil, transaction_id: nil)
        request_data = transaction_request_data(Endpoints::CANCEL_TRANSACTION, card_id, transaction_id)
        Request.perform_with_object(:post, request_data)
      end

      def resend_transaction(card_id: nil, transaction_id: nil)
        request_data = transaction_request_data(Endpoints::RESEND_TRANSACTION, card_id, transaction_id)
        Request.perform_with_object(:post, request_data)
      end

      def all_user_transactions(range: (0..4))
        request_data = RequestData.new(
          Endpoints::USER_PRIVATE_TRANSACTIONS,
          Entities::Transaction,
          authorization_header.merge(pagination_header_for_range(range))
        )
        Request.perform_with_objects(:get, request_data)
      end

      def all_card_transactions(card_id: nil, range: (0..4))
        request_data = RequestData.new(
          Endpoints.with_placeholders(Endpoints::CARD_PRIVATE_TRANSACTIONS, ':card' => card_id),
          Entities::Transaction,
          authorization_header.merge(pagination_header_for_range(range))
        )
        Request.perform_with_objects(:get, request_data)
      end

      private

      def transaction_request_data(endpoint, card_id, transaction_id)
        RequestData.new(
          Endpoints.with_placeholders(endpoint, ':card' => card_id, ':id' => transaction_id),
          Entities::Transaction,
          authorization_header
        )
      end
    end
  end
end
