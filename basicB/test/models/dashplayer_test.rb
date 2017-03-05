require "test_helper"

describe Dashplayer do
  let(:dashplayer) { Dashplayer.new }

  it "must be valid" do
    value(dashplayer).must_be :valid?
  end
end
