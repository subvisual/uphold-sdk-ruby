module Bitreserve
  module Endpoints
    AUTH = '/me/tokens'
    CARD = '/me/cards'
    CARD_PRIVATE_TRANSACTIONS = CARD + '/:card/transactions'
    COMMIT_TRANSACTION = CARD_PRIVATE_TRANSACTIONS + '/:id/commit'
    CANCEL_TRANSACTION = CARD_PRIVATE_TRANSACTIONS + '/:id/cancel'
    RESEND_TRANSACTION = CARD_PRIVATE_TRANSACTIONS + '/:id/resend'
    USER_PRIVATE_TRANSACTIONS = '/me/transactions'
    PUBLIC_TRANSACTIONS = '/reserve/transactions'
    STATS = '/reserve/statistics'
    TICKER = '/ticker'
    TRANSACTIONS = '/reserve/transactions'
    USER = '/me'
    USER_CONTACTS = '/me/contacts'
    USER_PHONES = '/me/phones'

    def self.with_placeholders(endpoint, substitutions = {})
      new_endpoint = endpoint.dup
      substitutions.each_pair do |placeholder, substitute|
        new_endpoint.gsub!(placeholder, substitute)
      end
      new_endpoint
    end
  end
end
