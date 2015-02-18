module Bitreserve
  module Pagination
    def pagination_header_for_range(range)
      return {} unless range

      { 'Range' => "items=#{range.min}-#{range.max}" }
    end
  end
end
