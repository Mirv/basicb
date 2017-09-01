require 'active_support/concern'

module DomainIdentities
  extend ActiveSupport::Concern

  def tester
    puts "HI"*25
  end

### Use this from now on
  
  class GameDsl
    
    def hi; puts "Hi"; end    
    def setUser; @user_id = User.first; end
    def setDash; @dash = Dash.first; end
    def setPlayer; @player = Player.first; end
      
    def userSetDash
      @owner = setUser
      @dash = @owner.dashes.create!(name: "Something")
    end     
  end
  
  class DashDslExt < GameDsl
    def userSetDash
      @user = setUser
      @dash = @user.dash.create!()
    end
  end
  
#### Don't use the module level anymore - backwards compatability till refactor only
  def setUser
    @user_id = current_user || User.first 
    # @user_id = current_user 
    # @user = User.find(@user_id)
  end
  
  def setDash
    # @user = setUser
    @user = self.current_user
    @dash = @user.dashes.first
  end
  
#### End backwards compatibility

  class PlayerHelper
    initialize  
      @user = setUser
      @dash = setDash(@user)
      @campaign = setCampaign
    end

    ### default names ###
    def defaultPlayerName
      @player_info = { screenname: "A shadowy & mysterious figure ... " }
    end
    
    def defaultCampaignName
      @campaign_info = { name: "A mysterious mission in a far away place ..." }
    end
    
    def defaultDashName
      @dash_info = { name: "A magical thing to see what the naked eye can not ... " }
    end
    
    ### Create new objects
      def createPlayer!
        Player.new(defaultPlayerName)
      end
       
      def createPlayer!(owner)
        owner.players.new(defaultPlayerName)
      end   
    
    ### Assign objects
      def assigner!(assigne, assigned, relationshipName)
        assigne = relationshipName.assigned
      end
    
    ### Assign new objects
    def assignDash!(player)
      # Player doesn't own the dash...dont use
      # player.dashplayers.create(dash_id: @dash.id)
      @dash.players.create(player_id: player.id, screenname: player.screenname)
    end
    
    def assignDash(player)
      dash = setDash
      player.dashplayers.create(dash_id: dash.id)
    end
    
    def assignCampaign(campaign_id)
      @campaign = Campaign.find(campaign_id) || Campaign.first
      owner.campplays.create(campaign_id: @campaign.id)
    end
    
    def assignRelationships(owner)
      #call 
      assignDash owner 
      assignCampaign owner
    end
  
    def makePlayer(owner)
      @dash = setDash
      @player = defaultPlayer Name
      
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
