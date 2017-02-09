require "test_helper"

describe Userplay do
  let(:userplay) { Userplay.new }

  it "must be valid" do
    value(userplay).must_be :valid?
  end
end
