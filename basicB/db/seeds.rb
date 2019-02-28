# ----- Note:  You must comment out any activerecord callbacks which insert or you'll get dupes...ie: user.rb has one

#### Grab all .rb files in the root/db/seeds directory ####
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

#### Definitions ####
#### Definitions ####
#### Definitions ####

counters = Hash.new
counters['campaigns'] = Campaign.count
counters['players'] = Player.count
counters['users'] = User.count
counters['countries'] = Country.count
counters['neighborhoods'] = Neighborhood.count

def guard_clause_present(target, location)
  puts "\n#{location} -- #{target.to_s}:  #{target}\n" unless target
end

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
### My base users ("a@test.com")
#  ... with present logins & campaign, player, country
#
def make_default_setup(number_defaults = 2, first_half_email ="a")
  front_email = first_half_email
  (1..number_defaults).each do |x|
    ApplicationRecord.transaction do
      default_user = makeDefaultUser number_defaults, front_email
      guard_clause_present default_user, "M-D-S: #{default_user.id}"
      next unless default_user 
      
      dash = make_dash_for_user default_user
      guard_clause_present dash, "M-D-S: #{dash.id}"
      next unless dash
      
      campaign = campaignCreate dash 
      guard_clause_present campaign, "M-D-S: #{campaign.id}"
      next unless campaign
      
      # Note: raw creates here - export later?
      newer_player = dash.players.create!(makePlayerInfo)
      guard_clause_present newer_player, "M-D-S: #{newer_player.id}"
    end
    front_email.next
  end
end



#
### Generate a limited number of users, then make them players
#
puts "filling campaigns ... \n"

fillCampaign 1
make_default_setup

#
### Summarizing 
#
puts "Pre-seeding counts ..."
counters.each do |x,y|
  puts "#{counters[x]} -- #{counters[y]}"
end

puts "Post seeding counts ..."
puts "#{Campaign.count} campaigns"
puts "#{Player.count} players"
puts "#{User.count} users..."
puts "#{Country.count} countries..."
puts "#{Neighborhood.count} neighbors..."



