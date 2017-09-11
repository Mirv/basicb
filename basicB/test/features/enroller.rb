require 'test_helper'
require 'Enroller'

### Some process observations
# -- Using the word enroller everywhere, means every line changes if enroller does
#    ... probably why tests are using "it" alot
# -- "must_change" isn't super specific, should probably assert it +/-'s 
#
# -- Probably need to test the row_count function retrieves a count
#
# -- Probably need to test that row_count & ID match if that's a thing...meh

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
  
  test "does execute_enrollment set values" do
    @enroller.execute_enrollment
    assert_not_nil @enroller.player
    assert_not_nil @enroller.organization
    assert_not_nil @enroller.campaign
  end


end
