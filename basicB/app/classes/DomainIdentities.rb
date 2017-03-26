require 'active_support/concern'

module DomainIdentities
  extend ActiveSupport::Concern

  def setUser
    @user = User.find(current_user.id)
  end
  
  # def setDash
  #   @dash = @user.userdash

  # def setDashViaCR
  #   @dash_user = @user.userdash.
  # end
  
end

class GameDsl
  extend DomainIdentities

  def setUsers(user)
    @user = user
  end

end



# class Board_game_dsl < Game_dsl
#   def setCampaign
#     @campaign = Campaign.find(params[:id]) || "1"
#   end
#   def setUser
#     @user = User.find(current_user.id)
#   end
  
# end
