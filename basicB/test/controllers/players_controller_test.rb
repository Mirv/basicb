require 'test_helper'


class PlayersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @player = players(:one)
    sign_in users(:validuser)
    
    setter = DomainIdentities::GameDsl.new
    # puts "#{setter.userSetDash}"
    # @user = setter.setUser
    # @dash = setter.setDash
    # @dash = userSetDash
    
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
    @player_test = Player.create(screenname: "test_screen_name")

    assert_difference('Player.count') do
      post players_url,  params: { player: { screenname: "Testee Name" } }  
    end
    # assert_redirected_to player_url(Player.last)
    # puts "redirect completed or failed"
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
    patch player_url(@player), params: { player: { screenname:  @player.screenname } }
    assert_redirected_to player_url(@player)
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete player_url(@player)
    end

    assert_redirected_to players_url
  end
end
