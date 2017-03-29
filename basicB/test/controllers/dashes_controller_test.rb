require "test_helper"
require "DomainIdentities"

class DashesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include DomainIdentities
  
  setup do
    @dash = dashes(:one)
    sign_in users(:validuser)
  end
  
  def should_get_dash_index
    get "/dashes"
    assert_select "h1", "Listing Dashboards"

    # assert page.has_content?("Listing Dashboards")
  end

  # it "gets dash index" do
  #   get dashes_url
  #   value(response).must_be :success?
  # end

  it "gets dash new" do
    get new_dash_url
    value(response).must_be :success?
  end

  it "creates dash" do
    expect {
      post dashes_url, params: { dash: { name: @dash.name } }
    }.must_change "Dash.count"

    must_redirect_to dash_path(Dash.last)
  end

  def test_shows_get
    get dashes_url(@dash)
    assert_select "h1", "Showing ..."
  end

  test "gets dash edit" do
    get edit_dash_url(@dash)
    assert_response :success
  end
  
  it "updates dash" do
    patch dash_url(@dash), params: { dash: { name: "NameMe" } }
    assert_response :redirect
  end

  test "should destroy dash" do
    assert_difference('Dash.count', -1) do
      delete dash_url(@dash)
    end
    assert_redirected_to dashes_url
  end
end
