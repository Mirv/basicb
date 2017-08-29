require "test_helper"

describe CampaignsController do
  before do
    sign_in users(:validuser)
    let(:campaign) { campaigns :one }
  end

  # it "executes join" do
  #   expect { 
  #     post :create, params: { campaign: { description: campaign.description, name: campaign.name, player_id: campaign.player_id } }
  #   }.to change { User.count }
  # end

  it "gets index" do
    get campaigns_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_campaign_url
    value(response).must_be :success?
  end

  it "creates campaign" do
    expect {
      post campaigns_url, params: { campaign: { description: campaign.description, name: campaign.name } }
    }.must_change "Campaign.count"

    must_redirect_to campaign_path(Campaign.last)
  end

  it "shows campaign" do
    get campaign_url(campaign)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_campaign_url(campaign)
    value(response).must_be :success?
  end

  it "updates campaign" do
    patch :update, params: { campaign: { description: campaign.description, name: campaign.name } }
    must_redirect_to campaign_path(campaign)
  end

  it "destroys campaign" do
    expect {
      delete campaign_url(campaign)
    }.must_change "Campaign.count", -1

    must_redirect_to campaigns_path
  end
end
