require 'active_support/concern'

module DomainIdentities
  extend ActiveSupport::Concern

  def setUser
    @user = User.find(current_user.id)
  end
  
  def setDash
    @user = setUser
    @dash = @user.dashes.first
  end

  def makePlayer(user)
    @player = user.players.create!(screenname: "A mysterious figure")
  end
  
  # Can this be included to be called in member notation (x.signPlayer)?
  def signPlayer(player, campaign)
    campaign.campplays.new(player_id: player)
  end
end

class GameDsl
  extend DomainIdentities

end

# class Board_game_dsl < Game_dsl
#   def setCampaign
#     @campaign = Campaign.find(params[:id]) || "1"
#   end
#   def setUser
#     @user = User.find(current_user.id)
#   end
  
# end
