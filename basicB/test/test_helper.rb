# ENV["RAILS_ENV"] = "test"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "capybara/rails"
require "minitest/rails"
require 'rails/test_help'
require "minitest/rails/capybara"
require 'DomainIdentities.rb'
require 'Enroller.rb'
require 'minitest/byebug' if ENV['DEBUG']
require 'devise'


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
   ActiveRecord::Migration.check_pending!
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods
  include Devise::Test::IntegrationHelpers
  include DomainIdentities
  include Rails.application.routes.url_helpers
end

class ActionDispatch::IntegrationTest
  ActiveRecord::Migration.check_pending!
  include Devise::Test::IntegrationHelpers
  include FactoryGirl::Syntax::Methods
  include DomainIdentities
  include Capybara::DSL
  include Capybara::Assertions
end

class Capybara::Rails::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all
  include Capybara::DSL
  include Devise::Test::IntegrationHelpers
  include DomainIdentities
  include Enroller
end