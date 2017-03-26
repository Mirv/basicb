require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  # test "sanity" do
  #   visit root_path
  #   assert_content page, "Hello World"
  #   refute_content page, "Goodbye All!"
  # end
  
  def test_homepage_has_content
    visit root_path
    assert page.has_content?("Listing campaigns")
  end
end
