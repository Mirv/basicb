def userDash(a_user)
  new_name = Faker::Cat.name ||=  "Mr Meowmix"
  new_name = "#{a_user.name}'s cat buddy ... #{new_name}"
  user_dash = a_user.dashes.create!(name: new_name)
  return user_dash
end

def dashcampaigns
  Faker::Book.title
end

def dashplayers
end