require "test_helper"

class CountriesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers


#describe NeighborhoodsController do
 # let(:neighborhood) { neighborhoods :one }
 
  setup do
    sign_in users(:validuser)
    @neighborhood = neighborhoods(:one)
  end
  
  test "should get index" do
    get neighborhoods_url
    assert_response :success
  end

  test "should get new" do
    get new_neighborhood_url
    assert_response :success
  end
  
  test "should create Neighborhood" do
    assert_difference('Neighborhood.count') do
      post neighborhoods_url, params: { neighborhood: { neighbor_id: '1', target_id: '2' }  }
    end
   assert_redirected_to neighborhood_url(Neighborhood.last)
  end

  test "should show neighborhood" do
    get neighborhoods_url(@neighborhood)
    assert_response :success
  end

  test "should get edit" do
    get edit_neighborhood_path(@neighborhood)
    assert_response :success
  end

  test "should update neighborhood" do
    patch neighborhood_url(@neighborhood), params: { neighborhood: { neighbor_id: '1', target_id: '2' } }
    assert_response :redirect
  end

  it "destroys neighborhood" do
    expect {
      delete neighborhood_url(@neighborhood)
    }.must_change "Neighborhood.count", -1

    must_redirect_to neighborhoods_path
  end
end
