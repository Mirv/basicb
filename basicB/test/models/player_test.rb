require "test_helper"

describe Player do
  let(:player) { Player.new }

  it "must be valid" do
    value(player).must_be :valid?
  end
end
