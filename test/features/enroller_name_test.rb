require 'test_helper'
require 'Enroller'

class EnrollerNameTest < ActiveSupport::TestCase
  def setup
    @user =  users(:one)
    @campaign = campaigns(:one)
    @enroller = Enroller::Enroller.new(@campaign.id, @user.id)
  end
  
  test "compose gives number above zero with no row count" do
    name = Enroller::Names.compose(1, nil)
    name = name.partition('#').last
    assert name.to_i > 0, true
  end
  
  test "compose gives number above zero with a zero row count" do
    name = Enroller::Names.compose(1, 0)
    name = name.partition('#').last
    assert name.to_i > 0, true
  end
  
  test "row_count_unique will fix zero count" do
    blah = Enroller::Names.row_count_unique
    assert blah > 0
  end
  
end
