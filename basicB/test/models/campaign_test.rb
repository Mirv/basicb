require "test_helper"

describe Campaign do
  let(:campaign) { Campaign.new }

  it "must be valid" do
    value(campaign).must_be :valid?
  end
end
