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

# Make a campaign owned by the user
first_user = default_user.campaigns.create!(name: "The First Age", description: "At start...")

# Make a player in the campaign
first_player = first_user.players.create!(makePlayerInfo)

# Make a country in the campaign, belonging to first player
first_country = first_player.countries.create!(countryGenerate(20))

# Make neighbors for first country
make_neighbors(first_country, max_neighbors)


#
### Generate a limited number of users, then make them players
#
(max_neighbors).times do | u | 
  cur_user_details = makeUserInfo(u) 

  new_user_made = User.create!(cur_user_details)

  new_player_made = new_user_made.players.create!(makePlayerInfo)

  new_country_made = new_player_made.countries.create!(countryGenerate(max_neighbors))

  new_country_made.states.create!(stateGenerate(max_neighbors, new_country_made["country_id"]))
  make_neighbors(new_country_made, max_neighbors)
end

puts "Created #{Player.count} players"
puts "Create #{User.count} users..."
puts "Created #{Country.count} countries..."
puts "Created #{Neighborhood.count} neighbors..."

