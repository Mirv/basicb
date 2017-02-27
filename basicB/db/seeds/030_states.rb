#
### get info to make a state, takes in a number to randomize & id of owner
#
def stateGenerate(count, country_id)
  hold = Hash.new
  name = Faker::Book.title 
  number = rand(count)
  owned_by = country_id
  name = "#{name} #{number}"

  hold = hold.merge({"name" =>  name})
  hold = hold.merge({"description" => Faker::Hacker.adjective})
  hold = hold.merge({"country_id" => owned_by})
  return hold
end