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

def aCount
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
makeDefaultUser

#
### Generate a limited number of users, then players
#
(max_neighbors).times do | u | 
  curUser = makeUserInfo(u) 
  # if hash has stuff, make a user
  if curUser
    newUser = User.create!(curUser)
    # if user exists, we make a player for them to use 
    if newUser
      newUser.players.create!(makePlayerInfo)
    else
      puts "Issue making User"
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
  curCountryStats = countryGenerate(noun_count)
  
  # commit it to database
  curCountry = countryCreate(curCountryStats)
  
  #
  ## Stub here for states
  #
  
  # if successful, make neighbors via the has_many relationship
  if (curCountry) then
    random_neighbors = rand(max_neighbors) 
    (random_neighbors).times do | xx |
      neighborStats = countryGenerate(noun_count)
      curCountry.neighbors.create!(neighborStats)
    end
  else
    puts "Error - CurCountry #{curCountry}, noun_count - #{noun_count}"
  end
end

puts "Created #{Country.count} countries..."
puts "Created #{Neighborhood.count} neighbors..."

