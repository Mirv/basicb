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
def nounCount
  20
end

#### Adding instances to database ####
#### Adding instances to database ####
#### Adding instances to database ####


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

(nounCount).times { | u | makeUsers(u) }
puts "Created #{Player.count} players as buddies..."

(nounCount).times  do | x |
  
  # generate stats for the country
  curCountryStats = countryGenerate(nounCount)
  
  # commit it to database
  curCountry = countryCreate(curCountryStats)
  
  # if successful, make neighbors via the has_many relationship
  if (curCountry) then
    (max_neighbors).times do | xx |
      neighborStats = countryGenerate(nounCount)
      curCountry.neighbors.create!(neighborStats)
    end
  else
    puts "Error - CurCountry #{curCountry}, nounCount - #{nounCount}"
  end

end

    # make_neighbors(aCountry, nounCount)
  #   aCountry.neighbors.new(countryCreate(
  #         "name" => aCountry.name, 
  #         "description" => aCountry.description,
  #         "size" => aCountry.size
  #         ))

  puts "Created #{Country.count} countries..."
  puts "Created #{Neighborhood.count} neighbors..."

