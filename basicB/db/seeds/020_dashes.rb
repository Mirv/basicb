def userDash(user)
  name = Faker::Cat.name
  user_dash = Dash.create!(name: name)
  return user_dash
end

def dashcampaigns
  Faker::Book.title
end

def dashplayers
end