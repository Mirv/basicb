class PlayersController < ApplicationController
  include DomainIdentities

  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /players
  # GET /players.json

  def index
    @players = Player.paginate(page: params[:page], per_page: 10)
    # Show all players belonging to the user in question
    @user_players = @user.players
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
  #  player_params = player_params.merge(screenname: a_name) unless player_params.key?("screenname")
  # u.dashes.first.dashplayers.first.player
    
    @player = Player.new(player_params)
    # @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end
    
    def set_user
      @user = User.find(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      # params.require(:player).permit(:id, :player_id, :screenname, :motto, :country_id, userplays_attributes: [:id, :user_id, :player_id]) # runs but still not permited
      # params.require(:player).permit(:id, :player_id, :screenname, :motto, :country_id, :user_id) # fails
      params.require(:player).permit(:id, :player_id, :screenname, :motto, :country_id, :dash_id, :user_id, :campaign_id, :screenname)
    end
end
