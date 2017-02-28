require "test_helper"

describe Usercamp do
  let(:usercamp) { Usercamp.new }

  it "must be valid" do
    value(usercamp).must_be :valid?
  end
end
