require "test_helper"

# setup do
#   @dash = dashes(:one)
#   sign_in users(:validuser)
#   @relation_dash_player = Dashplayer.new(dash_id: dashes(:one).id, player_id: dashes(:two).id)
# end

class Dashplayers < ActiveSupport::TestCase

  test "dashplayer not valid" do
    dashplayer = Dashplayer.new()  
    assert_not dashplayer.valid?
  end
end

