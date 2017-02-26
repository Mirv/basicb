require 'test_helper'


# in console can't assign the ' < ActiveSupport::TestCase ' due to super class
# might just be common name issue though
class Userplays < ActiveSupport::TestCase
  def setup
    @campaignPlayerCombo = Userplay.new(campaign_id: "1", player_id: "1", user_id: "1")
  end

  test 'valid player & campaign' do
    assert @campaignPlayerCombo.valid?
  end

  test 'invalid player & campaign' do
    @campaignPlayerCombo = Userplay.new()
    refute @campaignPlayerCombo.valid?, "passed validation somehow"
  end

end
