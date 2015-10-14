require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock

  config.filter_sensitive_data('<UPHOLD_AUTH_TOKEN>') { ENV['UPHOLD_AUTH_TOKEN'] }
end
