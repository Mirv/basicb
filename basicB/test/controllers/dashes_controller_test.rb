require "test_helper"


describe DashesController do
  
  let(:dash) { dashes :one }

  it "gets index" do
    get dashes_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_dash_url
    value(response).must_be :success?
  end

  it "creates dash" do
    expect {
      post dashes_url, params: { dash: { dashcampaigns_id: dash.dashcampaigns_id, dashplayers_id: dash.dashplayers_id, name: dash.name, user_id: dash.user_id } }
    }.must_change "Dash.count"

    must_redirect_to dash_path(Dash.last)
  end

  it "shows dash" do
    get dash_url(dash)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_dash_url(dash)
    value(response).must_be :success?
  end

  it "updates dash" do
    patch dash_url(dash), params: { dash: { dashcampaigns_id: dash.dashcampaigns_id, dashplayers_id: dash.dashplayers_id, name: dash.name, user_id: dash.user_id } }
    must_redirect_to dash_path(dash)
  end

  it "destroys dash" do
    expect {
      delete dash_url(dash)
    }.must_change "Dash.count", -1

    must_redirect_to dashes_path
  end
end
