require "test_helper"

class Campaignplaying_Test < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Listing campaigns"
  end
  
  test "can see the welcome page template" do
    get "/"
    assert_template 'campaigns#index'
  end
  
  test "can create an article" do
    @test_user = users(:validuser)
    get "/campaigns/new"
    assert_response :success
   
    post "/campaigns",
      params: { campaign: { name: "Do 'et", body: "That thing!" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "table", "Name:\n  Do 'et"
  end
end

