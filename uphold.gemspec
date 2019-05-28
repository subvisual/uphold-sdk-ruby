# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uphold/version'

Gem::Specification.new do |spec|
  spec.name          = 'uphold'
  spec.version       = Uphold::VERSION
  spec.authors       = ['Subvisual']
  spec.email         = ['miguel@subvisual.co', 'zamith@subvisual.co']
  spec.summary       = 'A wrapper for the Uphold API'
  spec.homepage      = 'https://github.com/subvisual/uphold-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'dotenv'
  spec.add_dependency 'httparty', '>= 0.13.3'
  spec.add_dependency 'virtus', '>= 1.0.4'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'climate_control'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'rubocop', '~> 0.70.0'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'
  spec.add_development_dependency 'webmock', '~> 1.20.4'
end
