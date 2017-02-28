#
### Flow:  
#
# 1) Users
# 2) Campaigns
# 3) Users
# 4) Players
# 5) Countries
# 6) Neighbors
# 7) States
#
###



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
## My base user & campaign
#
default_user = makeDefaultUser
default_user.campaigns.create!(name: "The First Age", description: "At start...")
    # Probably shouldn't gen players before the campaign they belong to
   # default_user.players.create!(makePlayerInfo)


#
### Generate a limited number of users, then make them players
#
(max_neighbors).times do | u | 
  cur_user_details = makeUserInfo(u) 
  # if hash has stuff, make a user
  if cur_user_details
    new_user_made = User.create!(cur_user_details)
    # if user exists, we make a player for them to use 
    if new_user_made
      new_player_made = new_user_made.players.create!(makePlayerInfo)
      if new_player_made then
        new_player_made.countries.create!(countryGenerate(max_neighbors))
      else
        puts "Issue making player - skipping making of country."
      end
    else
      puts "Issue making User - skipping making of player & country."
    end
  end
end

puts "Created #{Player.count} players"
puts "Create #{User.count} users..."


#
### Generate countries
#
(noun_count).times  do | x |
  
  # generate stats for the country
  cur_country_stats = countryGenerate(noun_count)
  
  # commit it to database
  cur_country = countryCreate(cur_country_stats)
  
  #
  ## Stub here for states
  #
  
  # if successful, make neighbors via the has_many relationship
  if (cur_country) then
    random_neighbors = rand(max_neighbors) 
    (random_neighbors).times do | xx |
      neighbor_stats = countryGenerate(noun_count)
      cur_country.neighbors.create!(neighbor_stats)
    end
  else
    puts "Error - cur_country #{cur_country}, noun_count - #{noun_count}"
  end
end

puts "Created #{Country.count} countries..."
puts "Created #{Neighborhood.count} neighbors..."

