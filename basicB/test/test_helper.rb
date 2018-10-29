# ENV["RAILS_ENV"] = "test"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

# require "minitest/rails"
# require "capybara/rails"
# require "minitest/rails/capybara"
# require 'capybara/minitest'
# require "minitest/rails"
require 'minitest/byebug' if ENV['DEBUG']

require 'rails/test_help'

require 'DomainIdentities.rb'
require 'Enroller.rb'
require 'devise'


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"


class ActiveSupport::TestCase
   ActiveRecord::Migration.check_pending!
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include FactoryBot::Syntax::Methods
  include Devise::Test::IntegrationHelpers
  include DomainIdentities
  include Rails.application.routes.url_helpers
end

class ActionDispatch::IntegrationTest
  fixtures :all
  ActiveRecord::Migration.check_pending!
  include Devise::Test::IntegrationHelpers
  include DomainIdentities
  include FactoryBot::Syntax::Methods
end

