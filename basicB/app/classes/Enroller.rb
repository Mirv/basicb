require 'active_support/concern'

#  See bottom for domain logic insights
module Enroller
  
  class Enroller
    extend ActiveSupport::Concern
  
    attr_accessor :player, :organization, :campaign
  
    def initialize(campaign_id, current_user_id)
      @user = User.find(current_user_id)
      @dashboard = @user.dashes.first
      @campaign = Campaign.find(campaign_id)
    end

    ### Mid level business logic methods
    # ... player & organization are created off relationship model implicitly
    # ... then assign methods explicitly create entries on the join tables
    
    def create_campaign_player
      @campaign.players.create!(screenname: "Test") 
    end
    
    def create_campaign_organization
      @campaign.countries.create!(name: "Blah")
      # works
      # Campcount.create!(campaign_id: @campaign.id, country_id: (Country.count))
    end
    
    # for some reason playcount or countplay doesn't appear to exist in basicB
    def assign_campaign_organization_to_player(organization, player)
      Countplay.create!(count: organization, player: player)
    end
  
    def assign_dashboard_player
      Dashplayer.create!(player_id: @player, dash_id: @dashboard)
    end
    
    # Dashcount doesn't exist yet, but is necessary to find orphaned countries in campaign
    def assign_dashboard_organization
      Dashcount.create!(country_id: @organization, dash_id: @dashboard)
    end
    
    def defaultOrganizationName
      @player_info = {name: "A mysterious group ... " }
    end
    def defaultPlayerName
      @player_info = { screenname: "A shadowy & mysterious figure ... " }
    end
    
    def defaultCampaignName
      @campaign_info = { name: "A mysterious mission in a far away place ..." }
    end
    
    def defaultDashName
      @dash_info = { name: "A magical thing to see what the naked eye can not ... " }
    end
  
    ### Top level business logic methods
    
    def execute_enrollment
      @player = create_campaign_player
      @organization = create_campaign_organization
      assign_campaign_organization_to_player(@organization, @player)
      assign_dashboard_player
      assign_dashboard_organization
    end

  end
end



##### Goals #####

#1 - handle enrollment of users in campaigns
#2 - concentrate making of all relationships

#### Business logic ####

#1a -- create player in campaign
#1b -- create organization in campaign (assigned to player too)
#2a -- assign player to dashboard of user controlling player
#2b -- assign organization to dashboard of user controlling player

#### Requirements ####

### Relationships
# user -> dashboard -> campaign -> player, organization
# dashboard -> campaign , player, organization 
# dashboard -> player -> organization

### Vars ###
# for campaign, dashboard, player, organization

### Methods ###
# Method to assign things to campaign
# Method to assign things to domain