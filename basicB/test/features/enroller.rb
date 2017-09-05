require 'test_helper'
require 'Enroller'

class EnrollerTest < ActiveSupport::TestCase
    # include Enroller::Enroller

# did it initialize - 3 vars set?
  def setup
    @user =  users(:one)
    @campaign = campaigns(:one)
  end
  
  test "did it initialize" do

      enroller = Enroller::Enroller.new(@campaign.id, @user.id)
      
      refute enroller.nil?
  end
  #


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
