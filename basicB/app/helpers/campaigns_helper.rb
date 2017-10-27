module CampaignsHelper
    def join_helper(campaign)
        new_campaign_registration_path(campaign_id: campaign)   
    end
end
