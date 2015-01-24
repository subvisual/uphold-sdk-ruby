if ENV['CI']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'bitreserve'
require 'climate_control'

Dir[File.join(Bitreserve::ROOT_PATH, '..', 'spec/support/**/*.rb')].each { |f| require f }

class DummyLogger
  def self.info(_message); end
end
Bitreserve.logger = DummyLogger

def with_modified_env(options, &block)
  ClimateControl.modify(options, &block)
end

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
end
