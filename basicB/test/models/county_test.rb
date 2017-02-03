require "test_helper"

class County_Test < ActiveSupport::TestCase
  def setup
    @county = County.create(name: "Example Item")
  end

  test 'valid county' do
    assert @county.valid?, 'county must have name'
  end
  
  # Test duplicate
  test 'invalid - duplicate county' do
    county = County.new(name: "Example Item")
    refute county.valid?, 'county passed without a name'
  end

end
