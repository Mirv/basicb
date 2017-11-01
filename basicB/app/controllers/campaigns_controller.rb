require 'DomainIdentities.rb'
require 'Enroller.rb'

class CampaignsController < ApplicationController
  include DomainIdentities

  before_action :setCampaign, only: [:join, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def join
  end
  
  def index
    @campaigns = Campaign.paginate(page: params[:page])
  end

  def show
    @campaign = setCampaign
    @user = setUser
    @dash = setDash

    # Old listings
    @ccountries = @campaign.campcounts.paginate(page: params[:page], per_page: 5)
    @pplayers = @campaign.players.paginate(page: params[:page], per_page: 5)
  end

  def new
    @campaign = Campaign.new
  end

  def edit
    @campaign = setCampaign
  end

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
  
  def destroy
    @campaign = setCampaign

    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def setCampaign
    # @campaign = Campaign.find(params[:id])
    @campaign = Campaign.find(params[:id])
  end

    def campaign_params
      params.require(:campaign).permit(:name, :description, :player_id)
    end
end
