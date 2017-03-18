require "test_helper"

class DashesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @dash = Dash.create!(name: "Steve")
    sign_in users(:validuser)
  end

  it "gets dash index" do
    get dashes_url
    value(response).must_be :success?
  end

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

  it "shows dash" do
    get dashes_url(@dash)
    assert_response :success
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
  
  # Test the /dash path I made
  test "test custom dash path" do
    dash_path @dash
    assert_response :success
  end
end
