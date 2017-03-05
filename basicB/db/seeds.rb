#### Grab all .rb files in the root/db/seeds directory ####
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

#### Definitions ####
#### Definitions ####
#### Definitions ####

def max_neighbors
  6
end

def a_count
  20
end

# Number of countries & players you want - switched to var for now
def noun_count
  20
end

#### Adding instances to database ####
#### Adding instances to database ####
#### Adding instances to database ####

#
## My base user & campaign, with 1st player & country
#

default_user = makeDefaultUser

if default_user then
  # Make a campaign owned by the user
  first_campaign = default_user.campaigns.create!(
      name: "The First Age", description: "At start...")
  if first_campaign
    # Make a player in the campaign
    puts "Campaign: #{first_campaign["name"]}"
    newer_player = default_user.players.create!(makePlayerInfo)
    puts "First player: #{newer_player["screenname"]}"
  end
end

#
### Generate a limited number of users, then make them players
#
(noun_count).times do | u | 
  begin
    cur_user_details = makeUserInfo(u) 
    new_user_made = User.create!(cur_user_details)
    new_player_made = new_user_made.players.create!(makePlayerInfo)
    neighbor = Campplay.create!(
        player_id: new_player_made["id"], campaign_id: 1)
    new_country_made = new_player_made.countries.create!(
      countryGenerate(max_neighbors))
    neighbor = Campcount.create!(
        country_id: new_country_made["id"], campaign_id: 1)
    new_country_made.states.create!(
      stateGenerate(max_neighbors, new_country_made["country_id"]))
    make_neighbors(new_country_made, max_neighbors)
  rescue Exception=>e
    puts "Error with User>Player.Neighobr>Country ownership chain Loop #: #{u}, 
      Message is: #{e.message}"
  else
    
  end
  
end

puts "Created #{Player.count} players"
puts "Create #{User.count} users..."
puts "Created #{Country.count} countries..."
puts "Created #{Neighborhood.count} neighbors..."



  