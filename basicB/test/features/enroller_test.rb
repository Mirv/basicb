require 'test_helper'
require 'Enroller'

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
    }.must_change ("Player.count") 
  end

  test "does enroller make organization in campaign successfully" do
    expect {
      @enroller.create_campaign_organization
    }.must_change "Country.count"
  end
  
  test "does enroller assign organization to player successfully" do
    expect {
      @enroller.setup_in_campaign
      @enroller.assign_organization_to_player
      @enroller.run_enrollment
    }.must_change "Playercountry.count"
  end

  test "does enroller assign player to dashboard successfully" do
    expect {
      @enroller.setup_in_campaign
      @enroller.setup_in_dashboard
      @enroller.run_enrollment
    }.must_change "Dashplayer.count" 
  end
  
  test "does enroller assign organization to dashboard successfully" do
    expect {
      @enroller.setup_in_campaign
      @enroller.assign_organization_to_player.save
      @enroller.assign_dashboard_organization.save
    }.must_change "Dashcount.count" 
  end

  test "all together now" do
    @enroller.enrolling
    @results = @enroller.result
    
    # duplicate from enroller.rb
    invalid_flag = false
    @results.map { |key, value| invalid_flag = true if (key.nil? || value.invalid?) }
    refute invalid_flag
  end
end
