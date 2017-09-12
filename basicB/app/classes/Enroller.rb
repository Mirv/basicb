require 'active_support/concern'

#  See bottom for domain logic insights
module Enroller
  
  class Enroller
    extend ActiveSupport::Concern
  
    attr_accessor :player, :organization, :campaign, 
      # Should I shove these into an array for easier metaprogramming?
      # :player_organization, :dashboard_player, :dashboard_organization
      :enrollment
  
    def initialize(campaign_id, current_user_id)
      # user isn't kept in hash with rest as once it finds dash, not necessary
      @user = user_find(current_user_id)
      
      # Lookup all the pertaining information to setup
      self.enrollment = Hash.new({})
      self.enrollment.default
      self.enrollment[:dashboard] = dash_find
      self.enrollment[:campaign] = Campaign.find(campaign_id)

    end

    ### Top level business logic methods
    
    #  Uses new/build methods to setup, instead of creating per call instantly
    def setup_enrollment
      self.enrollment[:player] = create_campaign_player
      self.enrollment[:organization] = create_campaign_organization
      self.enrollment[:player_organization] = assign_organization_to_player
      self.enrollment[:dashboard_player] = assign_dashboard_player
      self.enrollment[:dashboard_organization] = assign_dashboard_organization
    end
    
    def run_enrollment
      self.enrollment.each.save
      # @player.save
      # @organization.save
      # @player_organization.save
      # @dashboard_player.save
      # @dashboard_organization.save
    end
    
    def validate_enrollment
      invalid_flag = false
      self.enrollment.map {|x| x.nil? ? invalid_flag = true : ""}
      return invalid_flag
    end
    

    ### Mid level business logic methods
    # ... player & organization are created off relationship model implicitly
    # ... then assign methods explicitly create entries on the join tables
    
    def create_campaign_player
      total_rows = row_count_obj(Player.first)
      puts "#{total_rows}"
      self.enrollment[:player] = self.enrollment[:campaign].players.build(
        screenname: "#{defaultPlayerName} ##{(row_count_unique(total_rows))}") 
    end
    
    def create_campaign_organization
      total_rows = row_count_obj(Country.first)
       self.enrollment[:organization] = self.enrollment[:campaign].countries.build(
        name: "#{defaultOrganizationName}##{row_count_unique(total_rows)}")
    end
    
    def assign_organization_to_player
      #1 -- @player_organization = Playercountry.create!(country_id: @organization, player_id: @player)
      Playercountry.new(country_id: self.enrollment[:organization].id, player_id: self.enrollment[:player].id)
    end
     
    def assign_dashboard_organization
      Dashcount.new(country_id: self.enrollment[:organization], dash_id: self.enrollment[:dashboard].id)
    end
  
    def assign_dashboard_player
      Dashplayer.new(player_id: self.enrollment[:player].id, dash_id: self.enrollment[:dashboard].id)
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

    def user_find(current_user_id)
      User.find(current_user_id || User.create(screenname: "Default"))
    end
  
    def dash_find
      @user.dashes.first || Dash.create(name: "Default")
    end
  
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