require 'net/https'
require 'logger'
require 'httparty'

require 'bitreserve/version'
require 'bitreserve/endpoints'
require 'bitreserve/operations/all'
require 'bitreserve/operations/find'
require 'bitreserve/operations/multi_find'

module Bitreserve
  API_BASE = 'api.bitreserve.org'
  ROOT_PATH = File.dirname(__FILE__)

  @api_base = API_BASE
  @api_port = Net::HTTP.https_default_port
  @api_version = 0
  @logger = Logger.new(STDOUT)

  class << self
    attr_accessor :api_base, :api_port, :api_version, :logger
  end
end

require 'bitreserve/base_entity'
require 'bitreserve/request'
require 'bitreserve/ticker'
