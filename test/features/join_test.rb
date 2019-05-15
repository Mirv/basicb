require 'application_system_test_case'


### Note:  Part of the api interface test works with features/enroller.rb for integration

class JoinCampaignTest < ActionDispatch::IntegrationTest
  test "joining campaign should make player" do
    sign_in users(:validuser)  
    visit campaign_url(Campaign.first)
    assert_selector "h2", text: "Player List"
    click_on "Join"
    assert_selector '#notice', text: "Campaign registration was successfully created."
  end
end