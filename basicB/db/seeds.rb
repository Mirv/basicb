# ----- Note:  You must comment out any activerecord callbacks which insert or you'll get dupes...ie: user.rb has one

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

default_user = makeDefaultUser 1, "a@test.com"
userdashes = userDash default_user

campaign = campaignCreate userdashes
puts "Campaign -- #{campaign["name"]}"

newer_player = userdashes.players.create!(makePlayerInfo)
puts "First player -- #{newer_player["name"]}"

#
## My base 2nd user & campaign, with 1st player & country
#

another_user = makeDefaultUser 2, "b@test.com"
userdashes = userDash another_user

campaign = campaignCreate userdashes
puts "Campaign -- #{campaign["name"]}"

newer_player = another_user.players.create!(makePlayerInfo)
puts "Second player -- #{newer_player["name"]}"

# Make a player in the campaign
  # puts "Campaign: #{first_campaign["name"]}"
  # newer_player = default_user.players.create!(makePlayerInfo)
  # puts "First player: #{newer_player["name"]}"


#
### Generate a limited number of users, then make them players
#
puts "filling campaigns ... \n"

fillCampaign 1
fillCampaign 2


puts "Created #{Player.count} players"
puts "Create #{User.count} users..."
puts "Created #{Country.count} countries..."
puts "Created #{Neighborhood.count} neighbors..."



  