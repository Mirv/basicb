ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
# require "DomainIdentities"
require 'DomainIdentities.rb'
require 'factory_girl'
# require 'factory_girl_rails'
require 'minitest/byebug' if ENV['DEBUG']

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  # Test::controllerhelpers out in favor of integration which all rails controllers are now
  # include Devise::Test::ControllerHelpers
  include Devise::Test::IntegrationHelpers
  include FactoryGirl::Syntax::Methods
  # include DomainIdentities::GameDsl
  include DomainIdentities
  
  # include FactoryGirl::Syntax::Methods
end
