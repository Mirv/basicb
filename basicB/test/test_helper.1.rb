ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require 'capybara/rails'
require 'DomainIdentities'
require 'devise'


# require 'capybara/minitest'

# class ActionDispatch::IntegrationTest
#   # Make the Capybara DSL available in all integration tests
#   include Capybara::DSL
#   # Make `assert_*` methods behave like Minitest assertions
#   include Capybara::Minitest::Assertions

#   # Reset sessions and driver between tests
#   # Use super wherever this method is redefined in your individual test classes
#   def teardown
#     Capybara.reset_sessions!
#     Capybara.use_default_driver
#   end
# end

# Uncomment for awesome colorful output
# require "minitest/pride"
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  # include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  # include Devise::Test::ControllerHelpers
end

class ActionDispatch::IntegrationTest
  # include Devise::Test::ControllerHelpers
  include Devise::Test::IntegrationHelpers
  include DomainIdentities
  include FactoryGirl::Syntax::Methods
end