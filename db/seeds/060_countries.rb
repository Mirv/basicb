require 'filler.rb'
#
### Interfaces with faker api to get random data, returning a hash
## Pending improvements, take optional params of hash index's & apply rules
#

def genName
  name = Faker::LordOfTheRings.location
  count = pickPlayer()
  number = rand(count * 300)
  # The 10 ensures less chance of duplicate entries
  name = "#{name} of # #{number}"
  # puts "name: #{name}"
  return name
end


#### 
####
#### 
####
def pickPlayer(x = -1)
  count = x > -1 ? x : rand(Player.count - 1)
end


def countryGenerate(count)
  hold = Hash.new
  name = genName
  
  
  hold = hold.merge({"name" =>  name})
  hold = hold.merge({"description" => Faker::Hacker.adjective})
  # hold = hold.merge({"size" => rand(9)})

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
    size: args["size"],
    player_id: 1)
  return a_country
end


