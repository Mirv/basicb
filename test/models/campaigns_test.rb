require 'test_helper'

class CampaignsTest < ActiveSupport::TestCase
  test 'valid Campaign name' do
    cc = Campaign.new(name: "A new campaign")
    assert cc.valid?
  end
  
  test 'invalid Campaign name' do
    cc = Campaign.new(name: "")
    refute cc.valid?, 'Campaign must have name'
  end
  
  # test 'campaigns should list most recent first' do
  #   # assert_equal microposts(:most_recent), Micropost.first
  #   assert_equal campaigns(:most_recent), Campaign.first
  # end
end
