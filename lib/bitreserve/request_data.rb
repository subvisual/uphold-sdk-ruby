module Bitreserve
  class RequestData < Struct.new(:endpoint, :entity, :headers, :payload)
    def initialize(endpoint, entity, headers = {}, payload = nil)
      super
    end
  end
end
