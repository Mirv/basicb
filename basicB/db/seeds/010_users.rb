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



# --- spare users --- #

#
###  I feel like there's a better way to feed this into a hash after generating
#

def makeUserInfo(u)
  hold = Hash.new
  
  # get the info and apply any data shaping
  
  u = u * 1000
  random = rand(u)

  name = Faker::Cat.name ||= "Mr. Meowmix"
  email = "The#{name}#{u}#{random}@test.com"
  password = "ssssss"
  password_confirmation = password
  
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
  
  name = Faker::Name.name
  motto = Faker::StarWars.wookie_sentence 
  
  hold = hold.merge({"name" =>  name})
  hold = hold.merge({"motto" =>  motto})
end

#
### Generate a default test user, then a campaign
#
## Pending - do we want this to be a sideeffect as that blocks reusability?
#
## 
#
# def makeDefaultUser(number_defaults, first_half_email, email_domain = "test.com")
#   # puts "entering makeDefaultUser"
#   email = first_half_email + "@" + email_domain
#   if User.find_by( email: email )
#     puts "makeDefaultUser failed on ##{number_defaults} -- user already exists"
#     puts "Email:  #{email}"
#     return nil
#   else
#     # puts "calling makeUserInfo"
#     new_user_make = makeUserInfo(number_defaults)
#     new_user_make["email"] = email
#     new_user_made = User.create!(new_user_make)
#     print "New user made -- #{new_user_made}"
#     return new_user_made
#   end
#   #
#   ## Stub here for a single campaign to generate
#   #

# #  new_player_made = new_user_made.players.create!(makePlayerInfo)
# end

def makeDefaultUser(number_defaults, first_half_email, email_domain = "test.com")
  # puts "entering makeDefaultUser"
  email = first_half_email + "@" + email_domain
  puts "MDU - email:  #{email}"
  
  ### Note:  Extract this to check function & use it to replace later in process so new a, b default code doesn't fight old replacment
  
  if User.find_by( email: email )
    until !User.find_by( email: email )
      email = first_half_email.next + "@" + email_domain
      puts "makeDefaultUser incrementing past ##{number_defaults} w/#{email}-- user already exists"
      # puts "Email:  #{email}"
      # return nil
    end
  end
  puts "MDU - email - post check:  #{email}"
  # puts "calling makeUserInfo"
  new_user_make = makeUserInfo(number_defaults)
  new_user_make["email"] = email
  puts "Pre new user #{new_user_make[:email]}"
  new_user_made = User.create!(new_user_make)
  print "New user made -- #{new_user_made.name}"
  return new_user_made
  
end
