# frozen_string_literal: true

module Uphold
  module Pagination
    def pagination_header_for_range(range)
      return {} unless range

      { 'Range' => "items=#{range.min}-#{range.max}" }
    end
  end
end
