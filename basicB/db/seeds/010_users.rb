
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

email = "a@test.com"
pass = "aaaaaa"
unless User.find_by( email: email )
  newUser = takeInfo("A V R", email, pass, pass)
  newUser.save!
end


# --- spare users --- #

def makeUserInfo(u)
  hold = Hash.new
  
  random = rand(u)
  name = Faker::Cat.name
  email = "The#{name}#{u}#{random}@test.com"
  password = "aaaaaa"
  password_confirmation = "aaaaaa"
  
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
