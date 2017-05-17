require "test_helper"
require "factories.rb"

class DashesControllerTest <  ActionDispatch::IntegrationTest

  
  # setup do
  #   @users = users(:one, :two)
  #   @dash = dashes(:one)
  #   sign_in users(:validuser)
  #   @relation_dash_player = Dashplayer.create(dash_id: dashes(:one).id, player_id: dashes(:two).id)
  # end
  
  it "dashbard singular route test" do
    sign_in users(:validuser)
    # @my_dash = dashes(:one)

    player = create(:player)
    user = create(:user)
    get '/dashboard', params: {id: user.id}
    assert_response :success
  end

  
  test "relationship between dash and player" do
    assert @relation_dash_player.valid?  
  end
  
  test "relationship between dash and player - must have dash_id" do
    @relation_dash_player.dash_id = nil
    assert_not @relation_dash_player.valid?  
  end
  
  test "relationship between dash and player - must have player_id" do
    @relation_dash_player.player_id = nil
    assert_not @relation_dash_player.valid?  
  end
  
  def test_should_get_dash_index
    get dashes_url, params: { my_dash: @dash }
    # get dash_url(@dash)
    assert_response :success
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

  test "test show dash" do
    get dash_url(@dash)
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
end
