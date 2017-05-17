require 'DomainIdentities.rb'

class DashesController < ApplicationController
  include DomainIdentities

  before_action :set_dash, only: [:show, :dashboard, :edit, :update, :destroy]

  # GET /dashes
  # GET /dashes.json
  
  def dashboard
    # # version 3
    # @user = set_user
    # @my_dash = set_dash
    
    # Version 2
    @my_dash = setDash
    @dash_playing = @my_dash.players
    @dash_hosting = @my_dash.campaigns
  end
    
  def index
    @dashes_list = Dash.paginate(page: params[:page], per_page: 10)
  end

  # GET /dashes/1
  # GET /dashes/1.json
  def show
  end

  # GET /dashes/new
  def new
    @dash = Dash.new
  end

  # GET /dashes/1/edit
  def edit
  end

  # POST /dashes
  # POST /dashes.json
  def create
    @dash = Dash.new(dash_params)

    respond_to do |format|
      if @dash.save
        format.html { redirect_to @dash, notice: 'Dash was successfully created.' }
        format.json { render :show, status: :created, location: @dash }
      else
        format.html { render :new }
        format.json { render json: @dash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashes/1
  # PATCH/PUT /dashes/1.json
  def update
    respond_to do |format|
      if @dash.update(dash_params)
        format.html { redirect_to @dash, notice: 'Dash was successfully updated.' }
        format.json { render :show, status: :ok, location: @dash }
      else
        format.html { render :edit }
        format.json { render json: @dash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashes/1
  # DELETE /dashes/1.json
  def destroy
    @dash.destroy
    respond_to do |format|
      format.html { redirect_to dashes_url, notice: 'Dash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      User.find(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_dash(options = {})
      
      @dash = Dash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dash_params
      params.require(:dash).permit(:id, :name, :dashcampaigns_id, :dashplayers_id) #pulled user_id for player_controller test
    end
end
    # def setUser
    #   @user_ident = User.find(current_user.id)
    # end

    # def set_dash_via_cr(user)
    #   @dash_user = Dash.find(user)
    # end