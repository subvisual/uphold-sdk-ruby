# frozen_string_literal: true

require 'logger'
require 'httparty'
require 'dotenv'
require 'virtus'
Dotenv.load

require 'uphold/version'
require 'uphold/options'
require 'uphold/client'

module Uphold
  ROOT_PATH = File.dirname(__FILE__)

  @api_base = Options::API_BASE
  @api_version = 0
  @logger = Logger.new(STDOUT)

  class << self
    attr_accessor :api_base, :api_version, :logger

    def sandbox=(value)
      self.api_base = if value
                        Options::SANDBOX_API_BASE
                      else
                        Options::API_BASE
                      end
      Uphold::Request.update_base_uri
    end
  end
end

require 'uphold/helpers'
require 'uphold/request'
require 'uphold/request_data'
require 'uphold/entities/base_entity'
require 'uphold/entities/asset'
require 'uphold/entities/auth_token'
require 'uphold/entities/card'
require 'uphold/entities/contact'
require 'uphold/entities/ledger_entry'
require 'uphold/entities/phone'
require 'uphold/entities/ticker'
require 'uphold/entities/transaction'
require 'uphold/entities/user'
require 'uphold/entities/oauth_error'
require 'uphold/entities/error'
