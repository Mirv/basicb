require "test_helper"

class Player_Test < ActiveSupport::TestCase
  test 'valid player' do
    player = Player.new(screenname: 'aScreenName')
    assert player.valid?
  end

  test 'invalid player without name' do
    player = Player.new()
    refute player.valid?, 'player is valid without a name'
    assert_not_nil player.errors[:screenname], 'no validation error for name present'
  end

end