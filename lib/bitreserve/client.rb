require 'bitreserve/api'
require 'bitreserve/pagination'

module Bitreserve
  class Client
    include Pagination
    include API
    include Options

    def initialize(**options)
      @options = options
    end
  end
end
