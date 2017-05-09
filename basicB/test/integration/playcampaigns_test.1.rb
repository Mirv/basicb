# require "test_helper"

# class Campaignplaying_Test < ActionDispatch::IntegrationTest
#   include Devise::Test::IntegrationHelpers
#   include ApplicationHelper

  
#   def setup
#     @validuser = users(:validuser)
#     sign_in users(:validuser)
#     #need to test campaign creation
#     #need to test campaign's country creation
#     # @micropost = @validuser.microposts.build(content: "Lorem ipsum")
#   end
  
#   test "can see the welcome page" do
#     get "/"
#     assert_select "h1", "Listing campaigns"
#   end
  
#   test "title should be set" do
#     get "/"
#     assert_select "title", "Basic Borders"
#   end
  
#   test "can see the welcome page template" do
#     get "/"
#     assert_template 'campaigns/index'
#   end
  
#   test "can create a campaign" do
#     # ensure we can get to the campaign page
#     sign_in users(:validuser)
#     get "/campaigns/new"
#     assert_response :success
   
#     # do the actual post
#     post_title = "This thing"   
#     post_content = "Do this thing now!"
#     post "/campaigns",
#       params: { campaign: { name: post_title, body: post_content } }

#     # ensure page loads correctly
#     assert_response :redirect
#     follow_redirect!
#     assert_response :success

#     # make sure the new campaign is there
#     assert_match post_title, response.body
#   end
  
#   test "user can create a player" do
#     # ensure we can get to the campaign page
#     sign_in users(:validuser)
#     get "/campaigns/new"
#     assert_response :success
   
#     # do the actual post
#     post_title = "This thing"   
#     post_content = "Do this thing now!"
#     post "/campaigns",
#       params: { campaign: { name: post_title, body: post_content } }

#     # ensure page loads correctly
#     assert_response :redirect
#     follow_redirect!
#     assert_response :success

#     # make sure the new campaign is there
#     assert_match post_title, response.body
#   end
# end

