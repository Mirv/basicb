
def campaignCreate(owner)
  # Make a campaign owned by a user
  name = "#{owner.name}'s campaign"
  description = "At start..."
  first_campaign = owner.campaigns.create!(
      name: name, 
      description: description)
  return first_campaign
end

def fillCampaign(campaign)
  (noun_count).times do | u | 
    begin
      cur_user_details = makeUserInfo(u) 
      new_user_made = User.create!(cur_user_details)
      user_dash_made = userDash new_user_made
      new_player_made = user_dash_made.players.create!(makePlayerInfo)
      neighbor = Campplay.create!(
          player_id: new_player_made["id"], campaign_id: campaign)
      new_country_made = new_player_made.countries.create!(
        countryGenerate(max_neighbors))
      neighbor = Campcount.create!(
          country_id: new_country_made["id"], campaign_id: campaign)
      new_country_made.states.create!(
        stateGenerate(max_neighbors, new_country_made["country_id"]))
      make_neighbors(new_country_made, max_neighbors)
    rescue Exception=>e
      puts "Error with User>Player.Neighbor>Country ownership chain Loop #: #{u}, 
        Message is: #{e.message}"
    else
    end
  end
end