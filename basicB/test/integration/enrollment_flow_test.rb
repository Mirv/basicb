require 'test_helper'

# class EnrollmentFlowTest < ActionDispatch::IntegrationTest
class EnrollmentFlowTest < Capybara::Rails::TestCase
  test "the truth" do
    default_user = "a@test.com"
    default_pass = "ssssss"
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
    
    
    # 
    # last_registration = CampaignRegistration.last  # finding state of registrations in db before asserting change
    # assert page.has_content?("Campaign registration was successfully created.")
  # End sign check

  # Start enrollment process with capybara  
    within('.campaigns') do
      first('.list-group-item').click_link('Show') 
    end
    
    assert_equal flash[:success], "Signed in successfully.", "Flash message not success: Signed in..."
    
    # This is just to ensure there was a redirection & the test is setup for it
    # follow_redirect!
    # assert_redirected_to campaign_registration_path(1), "user isn't being redirected to their page after registration"
    # Did the player get made   
    # assert page.has_content?("Campaign registration was successfully created.")
    # assert_equal flash[:success], "Campaign registration was successfully created.", "flash[:success] isn't being set properly"
    
  end
end
