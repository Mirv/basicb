require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @country = countries(:one)
    sign_in users(:validuser)
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
      post countries_url, params: { country: { description: "Test - D", name: "TestName", size:"1" }   }
    end
   assert_redirected_to country_url(Country.last)
  end


  test "should show country" do
    sign_in users(:validuser)

    get country_url(@country)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:validuser)
    get edit_country_url(@country)
    assert_response :success
  end

  test "should update country" do
    patch country_url(@country), params: { country: { description: "Test - D", name: "TestName", size:"1" } }
    assert_response :redirect
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


### Mine post scaffold
  
  test "application title should be present" do
    #  Need to move this in refactor if I go from more than single page
    # assert :title

    # get country_url(@country)
    # assert_match /h/ , :title
    get countries_url
    assert_select "title", /Basic/
  end
  
  test "controller title should be present" do
    # sub part of app title
    get countries_url
    assert_select "title", /Countries/
  end
  
 # test "add country should dynamically insert a field via cocoon" do
    # no idea - apparantely broken - as the install route messed by import to rails directly
  
    # need to get the bug issue resolve - paused
    # html =  get edit_country_url(@country)
    # assert_have_tag(html, 'div class="form-inline"')
    
    # Plan is to count pre/post get/click the form
  #end
  
  test "should not save blank state" do 
    patch country_url(@country), params: { country: { description: @country.description, name: @country.name, size: @country.size } }
    assert_redirected_to country_url(@country)
  end
  
end
