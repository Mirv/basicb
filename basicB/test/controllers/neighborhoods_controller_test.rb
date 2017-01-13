require "test_helper"

describe NeighborhoodsController do
  let(:neighborhood) { neighborhoods :one }

  it "gets index" do
    get neighborhoods_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_neighborhood_url
    value(response).must_be :success?
  end

  it "creates neighborhood" do
    expect {
      post neighborhoods_url, params: { neighborhood: { neighbor_id: neighborhood.neighbor_id, target_id: neighborhood.target_id } }
    }.must_change "Neighborhood.count"

    must_redirect_to neighborhood_path(Neighborhood.last)
  end

  it "shows neighborhood" do
    get neighborhood_url(neighborhood)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_neighborhood_url(neighborhood)
    value(response).must_be :success?
  end

  it "updates neighborhood" do
    patch neighborhood_url(neighborhood), params: { neighborhood: { neighbor_id: neighborhood.neighbor_id, target_id: neighborhood.target_id } }
    must_redirect_to neighborhood_path(neighborhood)
  end

  it "destroys neighborhood" do
    expect {
      delete neighborhood_url(neighborhood)
    }.must_change "Neighborhood.count", -1

    must_redirect_to neighborhoods_path
  end
end
