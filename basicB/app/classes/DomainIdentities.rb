require 'active_support/concern'

module DomainIdentities
  extend ActiveSupport::Concern

  def setUser
    @user_id = User.first 
    # @user_id = current_user 
    # @user = User.find(@user_id)
  end
  
  def setDash
    # @user = setUser
    @user = current_user
    @dash = @user.dashes.first
  end
  
  class GameDsl
    def setUser
      @user_id = User.first 
    end

    def self.setUser
      @user_id = User.first 
    end
    
    def hi
      puts "Hi"
    end
  end

  class PlayerHelper
  
    # include UserHelpers::DomainIdentities
    # extend DomainIdentities
    # @dash = setDash
    # @dash = self.setDash
  
    def setUser
      current_user
    end
    
    def setDash
      @user = setUser
      @dash = @user.dashes.first
    end
  
    def defaultPlayer
      @player_info = { screenname: "A shadowy & mysterious figure ... " }
    end
    
    def defaultCampaign
      @campaign_info = { name: "A mysterious mission in a far away place ..." }
    end
    
    def defaultDash
      @dash_info = { name: "A magical thing to see what the naked eye can not ... " }
    end
    
    def createPlayer
      Player.new(defaultPlayer)
    end
     
    def createPlayer!(owner)
      owner.players.new(defaultPlayer)
    end   

    def assignDash(player)
      dash = setDash
      player.dashplayers.create(dash_id: dash.id)
    end
    
    def assignCampaign(campaign_id)
      @campaign = Campaign.first
      
      owner.campplays.create(campaign_id: @campaign.id)
    end
    
    def assignRelationships(owner)
      #call 
      assignDash owner 
      assignCampaign owner
    end
  
    def makePlayer(owner)
      @dash = setDash
      @player = defaultPlayer 
      
      respond_to do |format|
        if @player.save
          assignRelationships(@player)
          
          format.html { redirect_to @player, notice: 'Player was successfully created.' }
          format.json { render :show, status: :created, location: @player }
        else
          format.html { render :new }
          format.json { render json: @player.errors, status: :unprocessable_entity }
        end
      end
    end
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
