#
### Interfaces with faker api to get random data, returning a hash
## Pending improvements, take optional params of hash index's & apply rules
#
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

#
### Makes the country when fed 3 params in a hash
#
def countryCreate(args)
  # Record created object to return & commit to db
  a_country = Country.create!(
    name:  args["name"],
    description: args["description"],
    size: args["size"])
  return a_country
end

#
# Takes an object (country with an ID) & count
# Spits out random id number not equal to original object id number
#
def find_neighbor(country, count)
  neighbor_id = country
  # Ensure we loop until a country isn't it's own neighbor
  while neighbor_id == country.id do
    neighbor_id = 1 + rand(count) 
  end
  return neighbor_id
end 

#
### Takes an object (country with an ID) & count
# Generates array of unique id
# Side effect: fills join table with ids linking other M:M tables
#
def fill_neighbors(country, count)
  # Randomly select a number of neighbors to make
  a_number = 1 + rand(count)
  
  # Init array of ids
  neighbors = []
  
  # Begin turning out pairs of id's for neighborhoods
  a_number.times do 
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

#
### get info & create a random number of countries via neighborhood relationship
#
def make_neighbors(cur_country, number_neighbors)
  # Random number of neighbors
  random_neighbors = rand(number_neighbors) 
  
  (random_neighbors).times do | xx |
    # Get info to make country
    neighbor_stats = countryGenerate(number_neighbors)
    
    # Check neighbor isn't matched with itself
    if (neighbor_stats["name"] != cur_country["name"]) then
      # Make country
      cur_country.neighbors.create!(neighbor_stats)
    end
  end
end

