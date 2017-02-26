
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

  # Make at least 1 match with player in the first campaign
  # User.first.players.create!(
  #   screenname: "A's buddy", motto: "A's the way", country_id: "1")


# --- spare users --- #

def makeUsers(u)
  random = rand(u)
  email = "veloci#{u}this#{random}@test.com"
  unless User.find_by( email: email )
    User.create!(name:  "VR",
              email: email,
              password:              "aaaaaa",
              password_confirmation: "aaaaaa")
    # Make at least 1 match with player in the first campaign
    User.second.players.create!(
              screenname: "Veloci's buddy #{u}, #{random}", 
              motto: "V is for vroom",
              country_id: "1")
  end
end
