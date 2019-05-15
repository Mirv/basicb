require "test_helper"

class Neighborhoods < ActiveSupport::TestCase
  # class is testing for behaviors - references are structures
  # structures get tested elsewhere
  test 'invalid without neighbor_id' do
    user = Neighborhood.new(neighbor_id: '1')
    refute user.valid?, 'neighborhoods is valid without a neighbor_id'
    assert_not_nil user.errors[:name], 'no validation error for neighbor_id present'
  end

  test 'invalid without target_id' do
    user = Neighborhood.new(target_id: '1')
    refute user.valid?, 'neighborhoods is valid without a target_id'
    assert_not_nil user.errors[:name], 'no validation error for target_id present'
  end
end
