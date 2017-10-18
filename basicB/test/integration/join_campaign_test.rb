require 'test_helper'

class JoinCampaignTest < Minitest::Capybara::Spec
  # Capybara.add_selector(:link) do
  #   xpath { |num| ".//tbody/tr#[{num}]" }
  # end

  
  # test "the truth" do
  #   assert true
  # end
  def test_login
    visit '/'
    assert page.has_content?("Login")
    click_link('Login')
    assert page.has_content?("Log in")

    page.fill_in "user_email", with: "a@test.com"
    page.fill_in "user_password", with: "ssssss"
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
    # Did the player get made   
    assert page.has_content?("Player was successfully created.")
  end
end
