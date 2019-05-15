require "test_helper"
require "DomainIdentities"

class DashesControllerTest < ActionDispatch::IntegrationTest
  # include Devise::Test::ControllerHelpers

  include DomainIdentities


  # def test_should_get_dash_index
  #   get "/dashes"
  #   follow_redirect!
  #   puts @response.body
  #   assert_select "h1", "Listing Dashboards"
  #   # assert page.has_content?("Listing Dashboards")
  # end

end
