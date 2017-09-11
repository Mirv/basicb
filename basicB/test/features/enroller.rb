require 'test_helper'
require 'Enroller'

### Some process observations
# -- Using the word enroller everywhere, means every line changes if enroller does
#    ... probably why tests are using "it" alot
# -- "must_change" isn't super specific, should probably assert it +/-'s 

class EnrollerTest < ActiveSupport::TestCase
    # include Enroller::Enroller

# did it initialize - 3 vars set?
  def setup
    @user =  users(:one)
    @campaign = campaigns(:one)
    @enroller = Enroller::Enroller.new(@campaign.id, @user.id)
  end
  
  test "did enroller initialize" do
    refute @enroller.nil?
  end

  test "does enroller make player in campaign successfully" do
    expect {
      @enroller.create_campaign_player
    }.must_change "Player.count"
  end

  test "does enroller make organization in campaign successfully" do
    expect {
      @enroller.create_campaign_organization
    }.must_change "Country.count"
  end
  
  test "does enroller assign organization to player successfully" do
    expect {
      @enroller.create_campaign_player
      @enroller.create_campaign_organization
      @enroller.assign_organization_to_player
    }.must_change "Playercountry.count"
  end

  test "does enroller assign player to dashboard successfully" do
    expect {
      @enroller.create_campaign_player
      @enroller.assign_dashboard_player
    }.must_change "Dashplayer.count" 
  end
  
  test "does enroller assign organization to dashboard successfully" do
    expect {
      @enroller.create_campaign_player
      @enroller.create_campaign_organization
      @enroller.assign_organization_to_player
      @enroller.assign_dashboard_organization
    }.must_change "Dashcount.count" 
  end



#   test 'valid Campplay' do
#     cp = Campplay.new(player_id: "1", campaign_id: "1")
#     assert cp.valid?, 'Campplay must have name'
#   end
  
#   # Test one missing from pair of ID
#   test 'invalid - no campaign' do
#     cp = Campplay.new(player_id: 1)
#     refute cp.valid?, 'Campplay passed without a name'
#   end

#   test 'invalid - no player' do
#     cp = Campplay.new(campaign_id: 1)
#     refute cp.valid?, 'Campplay passed without a name'
#   end

end
