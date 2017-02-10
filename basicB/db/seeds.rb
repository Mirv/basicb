# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def aCount()
  return 10
end

# Random version of aCount
def getCount()
  return rand(aCount)
end

def find_neighbor(country)
  neighbor_id = country.id
  # Ensure we loop until a country isn't it's own neighbor
  while neighbor_id == country.id do
    neighbor_id = 1 + getCount
  end
  return neighbor_id
end 


# --- default user --- #
email = "a@test.com"
unless User.find_by( email: email )
  User.create!(name:  "A V R",
            email: email,
            password:              "aaaaaa",
            password_confirmation: "aaaaaa")
end

email = "veloci@test.com"
unless User.find_by( email: email )
  User.create!(name:  "VR",
            email: email,
            password:              "aaaaaa",
            password_confirmation: "aaaaaa")
end

# --- players --- #
10.times do | n |
  # Provision player info
  screenname = Faker::HarryPotter.character
  motto = Faker::HarryPotter.quote
  country = getCount
  
  # Commit new player
  Player.create(screenname: screenname, motto: motto, country_id: country)
end


# --- Country --- #
10.times do | b |
  
  # Provision country info
  name = Faker::LordOfTheRings.location
  description = Faker::Hacker.adjective
  size = getCount
  
  # Commit new country
  country = Country.create!(name: name, description: description, size: size)

  # Randomly select a number of neighbors to make
  random_count = 1 + getCount
  
  # Init array of ids
  neighbors = []
  
  # Begin turning out pairs of id's for neighborhoods
  random_count.times do | c |
    # Find suitable neigbhor_id
    neighbors << find_neighbor(country)
  end
  
  # Save each entry to database with main country's id as owner
  neighbors.each do | x |
    Neighborhood.create!({neighbor_id: x, target_id: country.id})
  end
  
end

public







# -----------------------------------------------#  
  
  # User.create!(name:  "Example User",
  #           email: "example@railstutorial.org",
  #           password:              "foobar",
  #           password_confirmation: "foobar",
  #           admin: true)


# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password)
# end
# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(5)
#   users.each { |user| user.microposts.create!(content: content) }
# end

# $ rails db:migrate:reset
# $ rails db:seed