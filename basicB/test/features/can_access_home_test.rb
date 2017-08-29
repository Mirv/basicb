require "test_helper"

class CanAccessHomeTest <  ActionDispatch::IntegrationTest
  # test "sanity" do
  #   visit root_path
  #   assert_content page, "Hello World"
  #   refute_content page, "Goodbye All!"
  # end
  
  def test_login_worked
    visit root_path
    assert page.has_content?("Listing campaigns")
    click_link('Login')

    assert page.has_content?("Login")
    page.fill_in "user_email", with: "a@test.com"
    page.fill_in "user_password", with: "ssssss"
    click_button "Log in"
    assert page.has_content?("Logout")
  end
  

end
