require 'active_support/concern'

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

module Enroller
  extend ActiveSupport::Concern

  def initialize(campaign_id, current_user)
    @user = current_user
    @dashboard = find_dashboard(@user) # This one looks up the dash id based on user id
    @campaign = Campaign.find(campaign_id)
    @organization = Country.new(name: defaultOrganizationName)
  end

  ### Top level business logic methods
  
  def execute_enrollment
    @player = create_campaign_player
    @organization = create_campaign_organization(@player)
    assign_campaign_organization_to_player(@organization, @player)
    assign_dashboard_player
    assign_dashboard_organization
  end

  ### Mid level business logic methods
  # ... player & organization are created off relationship model implicitly
  # ... then assign methods explicitly create entries on the join tables
  
  def create_campaign_player
    @campaign.players.create!(screenname: defaultPlayerName) 
  end
  
  def create_campaign_organization(player)
    @campaign.countries.create!(name: defaultOrganizationName)
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


  ### Create new player objects
  
    # create just the player, no relationship
    def createPlayer! 
      Player.new(defaultPlayerName)
    end
    
    # variable relationship owner with param, takes AR obj, req's has_many: :through
    def createPlayer!(owner)
      owner.players.new(defaultPlayerName)
    end
    
    # no parameter
    def createPlayer!
      @dashboard.players.create!(defaultPlayerName)
    end
  
  ### Assign objects
    def assigner!(assigne, assigned, relationshipName)
      assigne.relationshipName.create!(assigned)
    end
  
  # Assign new objects
  def assign_dash!(player)
    @dash.player.create!(player_id: player.id)
  end
  
  def assign_dash(player)
    player.dashplayers.create(dash_id: @dash.id)
  end
  
  def assignCampaign(campaign_id)
    @campaign = Campaign.find(campaign_id) || Campaign.first
    owner.campplays.create(campaign_id: @campaign.id)
  end
  
  def assignRelationships(owner)
    #call 
    assignDash owner 
    assignCampaign owner
  end
