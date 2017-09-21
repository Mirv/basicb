require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:validuser)
    @country = countries(:one)
  end

  test "should get index" do
    get countries_url
    assert_response :success
  end

  test "should get new" do
    get new_country_url
    assert_response :success
  end


  #  MOdeled after - http://edgeguides.rubyonrails.org/testing.html - but oddly in some places, not all - Article_url instead is used, but in my code post looks like plural - need mentor help
  test "should create country" do
    assert_difference('Country.count') do
      # post countries_url, params: { country: { description: @country.description, name: @country.name } } # removed from after country.name ... ', player_id: @country.player_id'
      post countries_url, params: { country: { description: "NEW", name: "NEWNAME", player_id: "1" } } # removed from after country.name ... ', player_id: @country.player_id'
    end

    assert_redirected_to country_url(Country.last)
  end

  test "should show country" do
    get country_url(@country)
    assert_response :success
  end

  test "should get edit" do
    get edit_country_url(@country)
    assert_response :success
  end

  test "should update country" do
    patch country_url(@country), params: { country: { description: @country.description, name: @country.name, player_id: @country.player_id } }
    assert_redirected_to country_url(@country)
  end

  # Should not allow destroying
  test "should destroy country" do
    assert_difference('Country.count', -1) do
      delete country_url(@country)
    end

    assert_redirected_to countries_url
  end
end
