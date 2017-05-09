require 'test_helper'

class CampaignRegistriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_registry = campaign_registries(:one)
  end

  test "should get index" do
    get campaign_registries_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_registry_url
    assert_response :success
  end

  test "should create campaign_registry" do
    assert_difference('CampaignRegistry.count') do
      post campaign_registries_url, params: { campaign_registry: { campaign_id: @campaign_registry.campaign_id, dash_id: @campaign_registry.dash_id, user_id: @campaign_registry.user_id, user_id: @campaign_registry.user_id } }
    end

    assert_redirected_to campaign_registry_url(CampaignRegistry.last)
  end

  test "should show campaign_registry" do
    get campaign_registry_url(@campaign_registry)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_registry_url(@campaign_registry)
    assert_response :success
  end

  test "should update campaign_registry" do
    patch campaign_registry_url(@campaign_registry), params: { campaign_registry: { campaign_id: @campaign_registry.campaign_id, dash_id: @campaign_registry.dash_id, user_id: @campaign_registry.user_id, user_id: @campaign_registry.user_id } }
    assert_redirected_to campaign_registry_url(@campaign_registry)
  end

  test "should destroy campaign_registry" do
    assert_difference('CampaignRegistry.count', -1) do
      delete campaign_registry_url(@campaign_registry)
    end

    assert_redirected_to campaign_registries_url
  end
end
