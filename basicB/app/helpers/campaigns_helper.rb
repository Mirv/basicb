module CampaignsHelper
    def join_helper(campaign)
        # campaign_registrations_path(campaign_id: campaign)
        link_to "Join", campaign_registrations_path(campaign_id: campaign), 
        method: :post, :class => "btn btn-xs btn-default"
    end
end
