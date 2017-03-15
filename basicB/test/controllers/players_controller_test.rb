require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @player = players(:one)
    sign_in users(:validuser)
  end

  test "should get index" do
    # sign_in users(:validuser)

    get players_url
    assert_response :success
  end

  test "should get new" do
    get new_player_url
    assert_response :success
  end

# # Old test
#   test "should create player" do
#     assert_difference('Player.count') do
#       post players_url, params: { player: { } }
#     end

#     assert_redirected_to player_url(Player.last)
#   end
  
  test "should create player" do
    # assert_difference('Country.count') do
    #   post countries_url, params: { country: { description: "Test - D", name: "TestName", size:"1" }   }
    # end
    
    assert_difference('Player.count') do
      post '/players',  params: { player: { screenname: "screenname" } } 
   #   get new_player_url, params: { player: { screenname: "screenname" } } 
    end
    assert_redirected_to player_path(Player.last)
  end

  test "should show player" do
    get player_url(@player)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_url(@player)
    assert_response :success
  end

  test "should update player" do
    patch player_url(@player), params: { player: { player:  @player } }
    assert_redirected_to player_url(@player)
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete player_url(@player)
    end

    assert_redirected_to players_url
  end
end
