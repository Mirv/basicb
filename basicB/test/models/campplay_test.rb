require 'test_helper'

class CampplayTest < ActiveSupport::TestCase

  test 'valid Campplay' do
    cp = Campplay.new(player_id: "1", campaign_id: "1")
    assert cp.valid?, 'Campplay must have name'
  end
  
  # Test one missing from pair of ID
  test 'invalid - no campaign' do
    cp = Campplay.new(player_id: 1)
    refute cp.valid?, 'Campplay passed without a name'
  end

  test 'invalid - no player' do
    cp = Campplay.new(campaign_id: 1)
    refute cp.valid?, 'Campplay passed without a name'
  end

end
