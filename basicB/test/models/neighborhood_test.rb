require "test_helper"

describe Neighborhood do
  let(:neighborhood) { Neighborhood.new }

  it "must be valid" do
    value(neighborhood).must_be :valid?
  end
end
