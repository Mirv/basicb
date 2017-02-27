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

# My base user
email = "a@test.com"
unless User.find_by( email: email )
  User.create!(
            name:  "A V R",
            email: email,
            password:              "aaaaaa",
            password_confirmation: "aaaaaa")
  # Make at least 1 match with player in the first campaign
  # User.first.players.create!(
  #   screenname: "A's buddy", motto: "A's the way", country_id: "1")
end

# Generate a limited number of users
(max_neighbors).times do | u | 
  curUser = makeUserInfo(u) 
  # if hash is good, make a user
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



(noun_count).times  do | x |
  
  # generate stats for the country
  curCountryStats = countryGenerate(noun_count)
  
  # commit it to database
  curCountry = countryCreate(curCountryStats)
  
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

