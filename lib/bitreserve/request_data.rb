module Bitreserve
  class RequestData < Struct.new(:endpoint, :entity, :headers, :payload, :auth)
    def initialize(endpoint, entity, headers = {}, payload = nil, auth = nil)
      super
    end
  end
end
