require 'bitreserve'

Dir[File.join(Bitreserve::ROOT_PATH, 'spec/support/**/*.rb')].each { |f| require f }

class DummyLogger
  def self.info(_message); end
end
Bitreserve.logger = DummyLogger
