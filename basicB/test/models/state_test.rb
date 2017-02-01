require 'test_helper'

class StateTest < ActiveSupport::TestCase
  test 'valid state' do
    aState = State.new(name: "aStateTest")
    assert aState.valid?, "state should be valid"
  end
  
    test 'invalid state' do
    aState = State.new(name: "")
    refute aState.valid?, "invalid state should not have passed"
  end
end
