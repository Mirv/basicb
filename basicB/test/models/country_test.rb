require "test_helper"

class Country_Test < ActiveSupport::TestCase
  def setup
    @country = Country.create(name: "Example Country")
  end

  test 'valid Country' do
    assert @country.valid?, 'Country must have name'
  end
  
  # Test duplicate
  test 'invalid - duplicate Country' do
    country = Country.new(name: "Example Country")
    refute country.valid?, 'Country passed without a name'
  end
end
