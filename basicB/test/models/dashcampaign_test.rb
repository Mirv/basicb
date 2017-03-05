require "test_helper"

describe Dashcampaign do
  let(:dashcampaign) { Dashcampaign.new }

  it "must be valid" do
    value(dashcampaign).must_be :valid?
  end
end
