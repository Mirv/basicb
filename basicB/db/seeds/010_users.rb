
# --- default user --- #


def takeInfo(name, email, password, password_confirmation)
  new_user_make = User.new do |u|
        u.name = name
        u.email = email
        u.password = password
        u.password_confirmation = password_confirmation
  end
  return new_user_make
end

#
### Generate a default test user, then a campaign
#
## Pending - do we want this to be a sideeffect as that blocks reusability?
#
def makeDefaultUser()

  email = "a@test.com"

  unless User.find_by( email: email )
    new_user_make = makeUserInfo(1)
    new_user_make["email"] = email
    new_user_made = User.create!(new_user_make)
    return new_user_made
  #
  ## Stub here for a single campaign to generate
  #
  end
#  new_player_made = new_user_made.players.create!(makePlayerInfo)
end


# --- spare users --- #

#
###  I feel like there's a better way to feed this into a hash after generating
#

def makeUserInfo(u)
  hold = Hash.new
  
  # get the info and apply any data shaping
  random = rand(u)
  name = Faker::Cat.name
  email = "The#{name}#{u}#{random}@test.com"
  password = "aaaaaa"
  password_confirmation = "aaaaaa"
  
  # load to hash .... can this be done more efficiently & keep ease of reading?
  hold = hold.merge({"name" =>  name})
  hold = hold.merge({"email" =>  email})
  hold = hold.merge({"password" =>  password})
  hold = hold.merge({"password_confirmation" =>  password_confirmation})
  
  return hold
end

# --- player names --- #

#
### generate info for a player owned by the user
#
def makePlayerInfo
  hold = Hash.new
  
  screenname = Faker::Name.name
  motto = Faker::StarWars.wookie_sentence 
  
  hold = hold.merge({"screenname" =>  screenname})
  hold = hold.merge({"motto" =>  motto})
end
