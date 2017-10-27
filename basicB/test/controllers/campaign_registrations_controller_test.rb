require "test_helper"

describe CampaignRegistrationsController do
  let(:campaign_registration) { campaign_registrations :one }

  it "gets index" do
    get campaign_registrations_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_campaign_registration_url
    value(response).must_be :success?
  end

  it "creates campaign_registration" do
    expect {
      post campaign_registrations_url, params: { campaign_registration: { campaign_id: campaign_registration.campaign_id, country_id: campaign_registration.country_id, dash_id: campaign_registration.dash_id, player_id: campaign_registration.player_id, user_id: campaign_registration.user_id } }
    }.must_change "CampaignRegistration.count"

    must_redirect_to campaign_registration_path(CampaignRegistration.last)
  end

  it "shows campaign_registration" do
    get campaign_registration_url(campaign_registration)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_campaign_registration_url(campaign_registration)
    value(response).must_be :success?
  end

  it "updates campaign_registration" do
    patch campaign_registration_url(campaign_registration), params: { campaign_registration: { campaign_id: campaign_registration.campaign_id, country_id: campaign_registration.country_id, dash_id: campaign_registration.dash_id, player_id: campaign_registration.player_id, user_id: campaign_registration.user_id } }
    must_redirect_to campaign_registration_path(campaign_registration)
  end

  it "destroys campaign_registration" do
    expect {
      delete campaign_registration_url(campaign_registration)
    }.must_change "CampaignRegistration.count", -1

    must_redirect_to campaign_registrations_path
  end
end
