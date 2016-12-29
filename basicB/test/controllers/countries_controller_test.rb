require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
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

  test "should create country" do
    assert_difference('Country.count') do
      post countries_url, params: { country: { description: @country.description, name: @country.name, size: @country.size } }
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
    patch country_url(@country), params: { country: { description: @country.description, name: @country.name, size: @country.size } }
    assert_redirected_to country_url(@country)
  end

  test "should destroy country" do
    assert_difference('Country.count', -1) do
      delete country_url(@country)
    end
    assert_redirected_to countries_url
  end
  
  test "should not update country blank" do
    country = Country.new
    assert_not country.save, "Should not save if continent name is blank"
  end
  
  # test "should not update country blank" do
  #   country = Country.State.new
  #   assert_not country.save, "Should not save if continent name is blank"
  # end
  
  test "application title should be present" do
    #  Need to move this in refactor if I go from more than single page
    # assert :title
    title = :title

    # get country_url(@country)
    # assert_match /h/ , :title
    get countries_url
    assert_select "title", /Basic/
  end
  
  test "controller title should be present" do
    # sub part of app title
    get countries_url
    assert_select "title", /Country/
  end

end
