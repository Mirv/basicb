require 'test_helper'

class EnrollmentFlowTest < ActionDispatch::IntegrationTest
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
    assert page.has_content?("Logout")
    assert page.has_content?("Listing campaigns")
  # End sign check

  # Start enrollment process with capybara  
    within('tbody') do
      first(:xpath, './tr').click_link('Join')
    end
    # Did the player get made   
    assert page.has_content?("Player was successfully created.")
    
  end
end
