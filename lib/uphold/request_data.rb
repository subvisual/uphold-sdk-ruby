# frozen_string_literal: true

module Uphold
  RequestData = Struct.new(:endpoint, :entity, :headers, :payload) do
    def initialize(endpoint, entity, headers = {}, payload = nil)
      super
    end
  end
end
