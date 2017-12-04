require 'test_helper'

# class EnrollmentFlowTest < ActionDispatch::IntegrationTest
class EnrollmentFlowTest < Capybara::Rails::TestCase
  test "the truth" do
    default_user = "a@test.com"
    default_pass = "ssssss"
    last_registration = CampaignRegistration.last  # finding state of registrations in db before asserting change
    ## For later testing
    # a_new_player = "James T. Hook"

  # Logged in & ready to test?
    visit root_path
    assert page.has_content?("Login")
    click_link('Login')
    assert page.has_content?("Log in")

    page.fill_in "user_email", with: default_user
    page.fill_in "user_password", with: default_pass
    click_button "Log in"
    assert page.has_content?("Logout") # logged in now
    assert page.has_content?("Campaign List")  # redirected to right page
    
    within('.campaigns') do
      first('.list-group-item').click_link('Show') # get to individual campaign
    end
    within('.container.body') do
      assert page.has_css?("div.jumbotron")  # did we get the show page successfully?
    # assert page.has_content?(".list-group")
    end

    


  end
end
