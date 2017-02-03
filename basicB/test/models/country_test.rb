require "test_helper"

class Country_Test < ActiveSupport::TestCase
  def setup
    @Country = Country.create(name: "Example Country")
  end

  test 'valid Country' do
    assert @Country.valid?, 'Country must have name'
  end
  
  # Test duplicate
  test 'invalid - duplicate Country' do
    Country = Country.new(name: "Example Country")
    refute Country.valid?, 'Country passed without a name'
  end
end
