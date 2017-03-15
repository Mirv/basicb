require "test_helper"

describe Usercamp do
  let(:usercamp) { Usercamp.new }

  # it "must be valid" do
  #   value(usercamp).must_be :valid?
  # end
  
  test 'valid Usercamp' do
    usercamp = Usercamp.new(user_id: "1", campaign_id: "1")
    assert usercamp.valid?
  end
end
