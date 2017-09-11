require 'active_support/concern'

#  See bottom for domain logic insights
module Enroller
  
  class Enroller
    extend ActiveSupport::Concern
  
    attr_accessor :player, :organization, :campaign
  
    def initialize(campaign_id, current_user_id)
      @user = User.find(current_user_id || User.create(screenname: "Default"))
      @dashboard = @user.dashes.first || Dash.create(name: "Default")
      @campaign = Campaign.find(campaign_id)
      @player = create_campaign_player
      # @country = create_campaign_organization
    end

    ### Top level business logic methods
    
    def execute_enrollment
      @player = create_campaign_player
      @organization = create_campaign_organization
      assign_campaign_organization_to_player(@organization, @player)
      assign_dashboard_player
      assign_dashboard_organization
    end

    ### Mid level business logic methods
    # ... player & organization are created off relationship model implicitly
    # ... then assign methods explicitly create entries on the join tables
    
    def create_campaign_player
      total_rows = row_count_obj(Player.first)
      @player = @campaign.players.create!(screenname: "Test#{(total_rows)}") 
    end
    
    def create_campaign_organization
      total_rows = row_count_obj(Country.first)
      @organization = campaign.countries.create!(name: "Blah#{total_rows}")
    end
    
    def assign_organization_to_player
      @player = Playercountry.create!(country_id: @organization, player_id: @player)
    end
     
    def assign_dashboard_organization
      Dashcount.create!(country_id: @organization, dash_id: @dashboard)
    end
  
    def assign_dashboard_player
      Dashplayer.create!(player_id: @player.id, dash_id: @dashboard.id)
      # Dashplayer.create!(player_id: Player.first.id, dash_id: Dash.first.id)
    end

    # Not tested

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
  
  ### Low level stuff
  
    def row_count_obj(ar_object)
      # ar_object.model_name.human.count
      # return ar_object.class.ancestors.include?(ActiveRecord::Base) ||
      # return ar_object.class.name.constantize.count || constantize(ar_object).count
      ar_object.class.name.constantize.count
    end
  
    def Organization_count
      Country.count
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