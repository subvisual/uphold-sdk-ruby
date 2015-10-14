require 'uphold/api'
require 'uphold/pagination'

module Uphold
  class Client
    include Pagination
    include API
    include Options

    def initialize(**options)
      @options = options
    end
  end
end
