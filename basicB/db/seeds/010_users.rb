
# --- default user --- #


def takeInfo(name, email, password, password_confirmation)
  newUser = User.new do |u|
        u.name = name
        u.email = email
        u.password = password
        u.password_confirmation = password_confirmation
  end
  return newUser
end

#
### Generate a default test user
#
## Pending - do we want this to be a sideeffect as that blocks reusability?
#
def makeDefaultUser()
  pass = "aaaaaa"
  email = "a@test.com"
  unless User.find_by( email: email )
    newUser = takeInfo("A V R", email, pass, pass)
    newUser.save!
  #
  ## Stub here for a single campaign to generate
  #
  end
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

def makePlayerInfo
  hold = Hash.new
  
  screenname = Faker::Name.name
  motto = Faker::StarWars.wookie_sentence 
  
  hold = hold.merge({"screenname" =>  screenname})
  hold = hold.merge({"motto" =>  motto})
  
end
