require 'test_helper'
require 'Enroller'

##  Note - should setup all the tests to reflect like test 'all together now' 
#     ... as it doesn't hit db, instead hits the model validation & nil checks
#     ... as this is significantly faster

class EnrollerTest < ActiveSupport::TestCase
    # include Enroller::Enroller

# did it initialize - 3 vars set?
  def setup
    @user =  users(:one)
    @campaign = campaigns(:one)
    @enroller = Enroller::Enroller.new(@campaign.id, @user.id)
  end
  
  test "did enroller initialize??" do
    refute @enroller.nil?
  end

  test "does enroller make player in campaign successfully" do
    assert_difference 'Player.count' do
      @enroller.create_campaign_player
    end
  end

  test "does enroller make organization in campaign successfully" do
    assert_difference "Country.count" do
      @enroller.create_campaign_organization
    end
  end
  
  test "does enroller assign organization to player successfully" do
    @enroller.setup_in_campaign
    @enroller.assign_organization_to_player
    assert_difference "Playercountry.count" do
      @enroller.run_enrollment
    end
  end

  test "does enroller assign player to dashboard successfully" do
    @enroller.setup_in_campaign
    @enroller.setup_in_dashboard
    assert_difference "Dashplayer.count" do 
      @enroller.run_enrollment
    end
  end
  
  test "does enroller assign organization to dashboard successfully" do
      @enroller.setup_in_campaign
      @enroller.assign_organization_to_player.save
    assert_difference "Dashcount.count" do
      @enroller.assign_dashboard_organization.save
    end
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
