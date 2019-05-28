# frozen_string_literal: true

module Uphold
  module Helpers
    def self.underscored_hash(hash)
      Hash[hash.map do |key, val|
        [underscored_key(key), val]
      end]
    end

    def self.camelized_hash(hash)
      Hash[hash.map do |key, val|
        [camelized_key(key), val]
      end]
    end

    def self.underscored_key(key)
      key.to_s.gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase.to_sym
    end

    def self.camelized_key(key)
      key.to_s.gsub(/(?:_)([a-z\d]*)/i) { Regexp.last_match[1].capitalize }.to_sym
    end
  end
end
