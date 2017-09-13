require 'active_support/concern'

#  See bottom for domain logic insights
module Enroller
  
  class Enroller
    extend ActiveSupport::Concern
  
    attr_accessor :player, :organization, :campaign, :enrollment

  
    def initialize(campaign_id, current_user_id)
      # user isn't kept in hash with rest as once it finds dash, not necessary
      @user = user_find(current_user_id)
  
      # Lookup all the pertaining information to setup
      @enrollment = Hash.new({})
      @enrollment.default
      @enrollment[:dashboard] = dash_find
      @enrollment[:campaign] = Campaign.find(campaign_id)
    end

    def showme
      puts enrollmentc
    end

    ### Top level business logic methods
    
    #  Uses new/build methods to setup, instead of creating per call instantly
    def setup_enrollment
      @enrollment[:player] = create_campaign_player
      @enrollment[:organization] = create_campaign_organization
      @enrollment[:player_organization] = assign_organization_to_player
      @enrollment[:dashboard_player] = assign_dashboard_player
      @enrollment[:dashboard_organization] = assign_dashboard_organization
    end
    
    def run_enrollment
      @enrollment.map {|x,y| y.save }
      # @player.save
      # @organization.save
      # @player_organization.save
      # @dashboard_player.save
      # @dashboard_organization.save
    end
    
    def invalid_enrollment?
      invalid_flag = false
      
      @enrollment.map { |key, value | invalid_flag = true if (key.nil? || value.invalid?) }
      
      puts "Still in here bob! ... flag #{invalid_flag}"
      
      # f-- enrollment.each {|x| puts x; invalid_flag = true if (x.nil? || x.valid?)  }
      # @enrollment.map {|x| invalid_flag = true if  x.valid? }
      # puts "This is it #{@enrollment[:campaign].valid?}"
      # return invalid_flag
    end
    
    def validate_ar_hash(ar_obj)
    end

    ### Mid level business logic methods
    # ... player & organization are created off relationship model implicitly
    # ... then assign methods explicitly create entries on the join tables
    
    def create_campaign_player
      total_rows = row_count_obj(Player.first)
      puts "#{total_rows}"
      @enrollment[:player] = @enrollment[:campaign].players.build(
        screenname: "#{defaultPlayerName} ##{(row_count_unique(total_rows))}") 
    end
    
    def create_campaign_organization
      
       @enrollment[:organization] = @enrollment[:campaign].countries.build(
        name: ComposeName(defaultOrganizationName, Country.first))
    end
    
    def assign_organization_to_player
      Playercountry.new(
        country_id: @enrollment[:organization].id, 
        player_id: @enrollment[:player].id)
    end
     
    def assign_dashboard_organization
      Dashcount.new(
        country_id: @enrollment[:organization], 
        dash_id: @enrollment[:dashboard].id)
    end
  
    def assign_dashboard_player
      Dashplayer.new(
        player_id: @enrollment[:player].id, 
        dash_id: @enrollment[:dashboard].id)
    end

    # Not tested

    def ComposeName(baseName, tableObject)
      total_rows = row_count_obj(tableObject)
      "#{defaultOrganizationName}##{row_count_unique(total_rows)}"
    end
    
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