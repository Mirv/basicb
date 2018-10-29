
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