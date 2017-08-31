#  See bottom for domain logic insights

require 'active_support/concern'

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