require 'test_helper'

# #### Grab all .rb files in the root/db/seeds directory ####
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }


class SeedTest < SeedTestSet
    
  test "make Player Info not blanks" do
    player_info = makePlayerInfo
    refute player_info['name'].blank?
    refute player_info['motto'].blank?
  end
  

#   byebug
  
  # test 'campaigns should list most recent first' do
  #   # assert_equal microposts(:most_recent), Micropost.first
  #   assert_equal campaigns(:most_recent), Campaign.first
  # end
end
