require "test_helper"

feature "To Do List" do
  scenario "displays a list of to-do items" do
    visit '/dashboard'
    page.must_have_css("H1")
  end
end