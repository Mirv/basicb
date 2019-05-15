# require "test_helper"
# require "factories.rb"

# ## Needs massive work - http://edgeguides.rubyonrails.org/testing.html - believe setup block & dashboard singular route test is too fragile


# class DashesControllerTest <  ActionDispatch::IntegrationTest

  
#   setup do
#     # @users = users(:one, :two)
#     @dash = dashes(:one)
#     sign_in users(:validuser)
#   end
  
#   it "dashbard singular route test" do
#     get '/dashboard'
#     assert_response :success
#   end

  
#   test "relationship between dash and player" do
#     @relation_dash_player = Dashplayer.create(dash_id: dashes(:one).id, player_id: dashes(:two).id)
#     assert @relation_dash_player.valid?  
#   end
  
#   test "relationship between dash and player - must have dash_id" do
#     @relation_dash_player = Dashplayer.create(dash_id: dashes(:one).id, player_id: dashes(:two).id)
#     @relation_dash_player.dash_id = nil
#     assert_not @relation_dash_player.valid?  
#   end
  
#   test "relationship between dash and player - must have player_id" do
#     @relation_dash_player = Dashplayer.create(dash_id: dashes(:one).id, player_id: dashes(:two).id)
#     @relation_dash_player.player_id = nil
#     assert_not @relation_dash_player.valid?  
#   end
  
#   def test_should_get_dash_index
#     get dashes_url, params: { my_dash: @dash }
#     # get dash_url(@dash)
#     assert_response :success
#   end

#   it "gets dash new" do
#     get new_dash_url
#     value(response).must_be :success?
#   end

#   it "creates dash" do
#     expect {
#       post dashes_url, params: { dash: { name: @dash.name } }
#     }.must_change "Dash.count"

#     must_redirect_to dash_path(Dash.last)
#   end

#   test "test show dash" do
#     get dash_url(@dash)
#     assert_response :success
#   end
  
#   test "gets dash edit" do
#     get edit_dash_url(@dash)
#     assert_response :success
#   end
  
#   it "updates dash" do
#     patch dash_url(@dash), params: { dash: { name: "NameMe" } }
#     assert_response :redirect
#   end

#   test "should destroy dash" do
#     # @dash = Dash.create!(name: @dash.name)
#     puts "Dash ID: #{@dash.id} -- Dash Count: #{Dash.count}"
#     assert_difference('Dash.count', -1, "Should delete one of them! #{@dash.count}") do
#     # puts "Dash pre:  #{Dash.count}"
#       # delete :destory, id: @dash
#       delete dash_url(@dash)
#     # puts "Dash post:  #{Dash.count}"
#     end
#     assert_redirected_to dashes_url
#     # puts "Test -- #{@dash.errors}"
#   end
# end
