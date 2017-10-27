require "test_helper"

describe CampaignRegistration do
  let(:campaign_registration) { CampaignRegistration.new }

  it "must be valid" do
    value(campaign_registration).must_be :valid?
  end
end
