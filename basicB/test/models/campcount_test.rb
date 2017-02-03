require 'test_helper'

class CampcountTest < ActiveSupport::TestCase

  test 'valid Campcount' do
    cc = Campcount.new(country_id: "1", campaign_id: "1")
    assert cc.valid?, 'Campplay must have name'
  end
  
  # Test one missing from pair of ID
  test 'invalid - no campaign' do
    cc = Campcount.new(country_id: 1)
    refute cc.valid?, 'Campplay passed without a campaign'
  end

  test 'invalid - no player' do
    cc = Campcount.new(campaign_id: 1)
    refute cc.valid?, 'Campplay passed without a country_id'
  end

end