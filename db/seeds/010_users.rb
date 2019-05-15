# --- default user --- #

def takeInfo(name, email, password)
  new_user_make = User.new do |u|
        u.name = name
        u.email = email
        u.password = password
        u.password_confirmation = password
  end
  return new_user_make
end

# --- spare users --- #

#
# get the info and apply any data shaping
#
def assembleUserInfo(u)
  hold = Hash.new
  u = u * 1000
  random = rand(u)
  name = Faker::Cat.name ||= "Mr. Meowmix"

  hold = hold.merge({
    "name" =>  name,
    "email" =>  "The#{name}#{u}#{random}@test.com",
    "password" =>  "ssssss",
    "password_confirmation" =>  "ssssss"
  })
  return hold
end


def makeDefaultUser(number_defaults = 1, first_half_email = "a", email_domain = "test.com")
  # puts "entering makeDefaultUser"

  ### Note:  Extract this to check function & use it to replace later in process so new a, b default code doesn't fight old replacment
  email = first_half_email + "@" + email_domain
  if User.find_by(email: email)
    puts "MDU -- incrementing past ##{number_defaults} w/#{email}-- user already exists"
    until !User.find_by(email: email)
      first_half_email = first_half_email.next 
      email = first_half_email + "@" + email_domain
    end
    puts "MDU -- email - post check:  #{email}"
  end
  
  # puts "calling makeUserInfo"
  new_user_make = assembleUserInfo(number_defaults)
  new_user_make["email"] = email
  puts "Pre new user #{new_user_make["email"]}"
  new_user_made = User.create!(new_user_make)
  print "New user made -- #{new_user_made.name}"
  return new_user_made
  
end
