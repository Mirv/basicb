require 'test_helper'

class JoinCampaignTest <  Capybara::Rails::TestCase
  # Capybara.add_selector(:link) do
  #   xpath { |num| ".//tbody/tr#[{num}]" }
  # end

  
  # test "the truth" do
  #   assert true
  # end
  def test_login
    visit root_path
    @email = "testest@test.com"
    @password = "ssssss"
    @user = User.find_by(email: @email) || User.create!(email: @email, password: @password, password_confirmation: @password)
    visit '/'
    assert page.has_content?("Login")
    click_link('Login')
    assert page.has_content?("Log in")

    page.fill_in "user_email", with: @email
    page.fill_in "user_password", with: @password
    click_button "Log in"

    # Are we logged in?
    assert page.has_content?("Logout")
    # Goto show page?  Skipping
    # Are we on page successfully?
    assert page.has_content?("Listing campaigns")

    within('tbody') do
      # Click Join
      first(:xpath, './tr').click_link('Join')
    end
    # Did the player get made    - old going with did campaign registry load now
    # assert page.has_content?("Player was successfully created.")
    # assert_redirected_to new_campaign_registration_path
    # assert_equal 302, status # integration test inherited code
    assert_current_path new_campaign_registration_path(CampaignRegistration.last)
  end
end
