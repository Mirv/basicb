require 'active_support/concern'

#  See bottom for domain logic insights
module Enroller
  
  class Enroller
    extend ActiveSupport::Concern
  
    attr_accessor :player, :organization, :campaign, 
      :player_organization, :dashboard_player, :dashboard_organization
  
    def initialize(campaign_id, current_user_id)
      @user = User.find(current_user_id || User.create(screenname: "Default"))
      @dashboard = @user.dashes.first || Dash.create(name: "Default")
      @campaign = Campaign.find(campaign_id)
      # @player = create_campaign_player
      # @country = create_campaign_organization
    end

    ### Top level business logic methods
    
    #  Does 
    def execute_enrollment
      @player = create_campaign_player
      @organization = create_campaign_organization
      #1 -- assign_organization_to_player
      #2 -- ...
      @player_organization = assign_organization_to_player
      @dashboard_player = assign_dashboard_player
      @dashboard_organization = assign_dashboard_organization
    end
    
    def rollback
      
      ## This fails
      ## Attemping dynamic rollback of all vars minus the 3 we had before object
      self.instance_variables.map do |vars|
        if vars == :@user || vars == :@campaign || vars == :@dashboard
          # puts "True -- #{vars}"
        else
          puts "False -- #{vars}"
          vars.destroy
        end
      end
    end

    ### Mid level business logic methods
    # ... player & organization are created off relationship model implicitly
    # ... then assign methods explicitly create entries on the join tables
    
    def create_campaign_player
      total_rows = row_count_obj(Player.first)
      puts "#{total_rows}"
      self.player = @campaign.players.create!(
        screenname: "#{defaultPlayerName} ##{(row_count_unique(total_rows))}") 
    end
    
    def create_campaign_organization
      total_rows = row_count_obj(Country.first)
      self.organization = campaign.countries.create!(name: "#{defaultOrganizationName}##{row_count_unique(total_rows)}")
    end
    
    def assign_organization_to_player
      #1 -- @player_organization = Playercountry.create!(country_id: @organization, player_id: @player)
      Playercountry.create!(country_id: @organization, player_id: @player)
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
      "A mysterious group ... "
    end
    
    def defaultPlayerName
      "A shadowy & mysterious figure ... "
    end
    
    def defaultCampaignName
      "A mysterious mission in a far away place ..." 
    end
    
    def defaultDashName
      "A magical thing to see what the naked eye can not ... " 
    end
  
  ### Low level stuff
  
    # issues with if initial object doesn't load due to validation
    # ... the number saved in name might be in use
    def row_count_unique(number)
      rand(1000) * rand(1000) * rand(number)
    end
  
    # count of all rows in db of passed active record object
    def row_count_obj(ar_object)
      # ar_object.model_name.human.count
      # return ar_object.class.ancestors.include?(ActiveRecord::Base) ||
      # return ar_object.class.name.constantize.count || constantize(ar_object).count
      ar_object.class.name.constantize.count + 1
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