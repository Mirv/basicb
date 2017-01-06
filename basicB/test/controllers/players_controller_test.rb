require "test_helper"

describe PlayersController do
  let(:player) { players :one }

  it "gets index" do
    get players_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_player_url
    value(response).must_be :success?
  end

  it "creates player" do
    expect {
      post players_url, params: { player: { country_id_id: player.country_id_id, motto: player.motto, screenname: player.screenname } }
    }.must_change "Player.count"

    must_redirect_to player_path(Player.last)
  end

  it "shows player" do
    get player_url(player)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_player_url(player)
    value(response).must_be :success?
  end

  it "updates player" do
    patch player_url(player), params: { player: { country_id_id: player.country_id_id, motto: player.motto, screenname: player.screenname } }
    must_redirect_to player_path(player)
  end

  it "destroys player" do
    expect {
      delete player_url(player)
    }.must_change "Player.count", -1

    must_redirect_to players_path
  end
end
