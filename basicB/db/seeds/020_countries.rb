
# def countryCreate
#   name =  Faker::LordOfTheRings.location
#   # Get the country info after checking name
#   if Country.find_by(name: name) then 
#     newCountry = Country.find_or_create_by!(name: name) do |c|
#           c.description = Faker::Hacker.adjective
#           c.size = rand(9)
#     end
#   end
#   return newCountry
# end

def countryGenerate(count)
  hold = Hash.new
  name = Faker::LordOfTheRings.location
  number = rand(count * 30)
  # The 10 ensures less chance of duplicate entries
  name = "#{name} #{number}"
  # puts "name: #{name}"
  
  hold = hold.merge({"name" =>  name})
  hold = hold.merge({"description" => Faker::Hacker.adjective})
  hold = hold.merge({"size" => rand(9)})

  # puts "Generater -- Hold-name: #{hold["name"]}"
  return hold
end


def countryCreate(args)
  # Record created object to return & commit to db
  aCountry = Country.create!(
    name:  args["name"],
    description: args["description"],
    size: args["size"])
    
  # puts "Args-name: #{args}"
  # puts args["name"]
  # puts "Test Args[\"name\"]"
    
  return aCountry
end

# Takes an object (country with an ID) & count
# Spits out random id number not equal to original object id number
def find_neighbor(country, count)
  neighbor_id = country
  # Ensure we loop until a country isn't it's own neighbor
  while neighbor_id == country.id do
    neighbor_id = 1 + rand(count) 
  end
  return neighbor_id
end 

# Takes an object (country with an ID) & count
# Generates array of unique id
# Side effect: fills join table with ids linking other M:M tables
def make_neighbors(country, count)
  # Randomly select a number of neighbors to make
  aNumber = 1 + rand(count)
  
  # Init array of ids
  neighbors = []
  
  # Begin turning out pairs of id's for neighborhoods
  aNumber.times do 
    # Find suitable neigbhor_id
    neighbors << find_neighbor(country, count)
  end
  
  # Drop duplicate entries to avoid the sql constraint
  neighbors = neighbors.uniq
  
  # Save each entry to database with main country's id as owner
  neighbors.each do | x |
    Neighborhood.create!({neighbor_id: x, target_id: country.id})
  end
end
