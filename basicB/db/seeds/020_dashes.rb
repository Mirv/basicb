def userDash(a_user)
  new_name = Faker::Cat.name
  new_name = "#{a_user["name"]}'s cat buddy ... #{new_name}"
  user_dash = user.dashes.create!(name: new_name)
  return user_dash
end

def dashcampaigns
  Faker::Book.title
end

def dashplayers
end