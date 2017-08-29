require "test_helper"
require 'minitest/autorun'

  # scenario "the test is sound" do
  #   visit root_path
  #   page.must_have_content "Hello World"
  #   page.wont_have_content "Goodbye All!"
  # end

class JoinCampaignTest < Minitest::Capybara::Spec
  
  def joining_campaign_should_make_player
    sign_in users(:validuser)  
    visit '/'
    
    assert_content "Homepage"
    page.must_have_content "Homepage"
    # visit campaigns_path
    # assert_response 200
  end
end