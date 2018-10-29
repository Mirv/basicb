# --- player names --- #

#
### generate info for a player owned by the user
#
def makePlayerInfo
  hold = Hash.new
  hold = hold.merge({
      "name" =>  Faker::Name.name, 
      "motto" =>  Faker::StarWars.wookie_sentence
  })
end