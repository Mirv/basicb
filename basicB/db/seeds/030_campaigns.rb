
def campaignCreate(owner)
  return unless owner
  # Make a campaign owned by a user
  name = "#{owner.name}'s campaign"
  description = "At start..."
  first_campaign = owner.campaigns.create!(
      name: name, 
      description: description)
  puts "Campaign -- #{first_campaign["name"]}"
  return first_campaign
end

def fillCampaign(campaign)
  (noun_count).times do | u | 
    ApplicationRecord.transaction do
      begin
        cur_user_details = makeUserInfo(u) 
        new_user_made = User.create!(cur_user_details)
        user_dash_made = make_dash_for_user new_user_made
        new_player_made = user_dash_made.players.create!(makePlayerInfo)
  
        # Note:  can we pull the neighobr variable here?
        # assign player to a campaign - not sure why neighbor is here
        neighbor = Campplay.create!(
            player_id: new_player_made["id"], campaign_id: campaign)
        # player object creates a new country
        new_country_made = new_player_made.countries.create!(
          countryGenerate(max_neighbors))
        
        # Note:  can we pull the neighobr variable here?
        # assign country to a campaign
        neighbor = Campcount.create!(
            country_id: new_country_made["id"], campaign_id: campaign)
        # country creates states
        new_country_made.states.create!(
          stateGenerate(max_neighbors, new_country_made["country_id"]))
          
        # call to sub to generate a list of neighbors
        make_neighbors(new_country_made, max_neighbors)
      rescue 
        puts "Error with User>Player.Neighbor>Country ownership chain Loop #: #{u}, 
          Message is: #{e.message}"
      else
      end
    end
  end
end