require 'DomainIdentities.rb'

class CampaignsController < ApplicationController
  # include ApplicationHelper
  include DomainIdentities
  
  # before_action :set_campaign, only: [:join, :edit, :update, :destroy]
  # before_action :set_dash
  skip_before_action :authenticate_user!, only: [:index]

  def join
    @player = Player.new(screenname: "A dark and mysterious figure ... ")

    respond_to do |format|
      if @player.save
        
        @campaign = setCampaign
        puts "#{@campaign.id}"
        @player.campplays.create!(campaign_id: @campaign.id)
        
        @dash = setDash
        @player.dashplayers.create(dash_id: @dash.id)
        
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
   
    # redirect_to new_player_path
  end
  
  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.paginate(page: params[:page])
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @campaign = setCampaign
    @user = setUser
    # @user = setUser(current_user)
    @dash = setDash
    # byebug

    # Old listings
    @ccountries = @campaign.campcounts.paginate(page: params[:page], per_page: 5)
    @pplayers = @campaign.players.paginate(page: params[:page], per_page: 5)
  end

  # GET /campaigns/new
  #test
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
    @campaign = setCampaign
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    @campaign = setCampaign
    respond_to do |format|
      if @campaign.update!(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign = setCampaign

    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def setCampaign
    @campaign = Campaign.find(params[:id]) 
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:name, :description, :player_id)
    end
end
