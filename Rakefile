require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'
RuboCop::RakeTask.new
RSpec::Core::RakeTask.new(:spec)

task :console do
  require 'pry'
  require 'bitreserve'
  ARGV.clear
  Pry.start
end

task default: [:rubocop, :spec]
