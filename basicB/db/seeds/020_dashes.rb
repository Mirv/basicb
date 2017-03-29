def userDash(user)
  name = Faker::Cat.name
  name = "#{user.name}'s cat buddy ... #{name}"
  user_dash = user.dashes.create!(name: name)
  return user_dash
end

def dashcampaigns
  Faker::Book.title
end

def dashplayers
end