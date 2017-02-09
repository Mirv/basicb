require "test_helper"

describe UserplaysController do
  let(:userplay) { userplays :one }

  it "gets index" do
    get userplays_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_userplay_url
    value(response).must_be :success?
  end

  it "creates userplay" do
    expect {
      post userplays_url, params: { userplay: { campaign_id: userplay.campaign_id, player_id: userplay.player_id } }
    }.must_change "Userplay.count"

    must_redirect_to userplay_path(Userplay.last)
  end

  it "shows userplay" do
    get userplay_url(userplay)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_userplay_url(userplay)
    value(response).must_be :success?
  end

  it "updates userplay" do
    patch userplay_url(userplay), params: { userplay: { campaign_id: userplay.campaign_id, player_id: userplay.player_id } }
    must_redirect_to userplay_path(userplay)
  end

  it "destroys userplay" do
    expect {
      delete userplay_url(userplay)
    }.must_change "Userplay.count", -1

    must_redirect_to userplays_path
  end
end
