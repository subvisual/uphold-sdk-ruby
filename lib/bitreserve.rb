require 'logger'
require 'httparty'
require 'dotenv'
Dotenv.load

require 'bitreserve/version'
require 'bitreserve/client'

module Bitreserve
  API_BASE = 'https://api.bitreserve.org'
  ROOT_PATH = File.dirname(__FILE__)

  @api_base = API_BASE
  @api_version = 0
  @logger = Logger.new(STDOUT)

  class << self
    attr_accessor :api_base, :api_version, :logger
  end
end

require 'bitreserve/request'
require 'bitreserve/request_data'
require 'bitreserve/entities/base_entity'
require 'bitreserve/entities/ticker'
require 'bitreserve/entities/card'
require 'bitreserve/entities/user'
require 'bitreserve/entities/phone'
require 'bitreserve/entities/transaction'
