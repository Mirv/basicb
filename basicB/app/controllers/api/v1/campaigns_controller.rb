class Api::V1::CampaignsController < Api::V1::BaseController
  def show
    campaign = Campaign.find(params[:id])

    render(json: Api::V1::CampaignSerializer.new(campaign).to_json)
  end
end