ENV['RACK_ENV'] = "test"

require './chitter'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'setup_test_database'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.formatter = :documentation

  config.before(:each) do
    setup_test_database
  end

end