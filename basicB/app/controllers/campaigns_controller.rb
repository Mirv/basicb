require 'DomainIdentities.rb'
require 'Enroller.rb'

class CampaignsController < ApplicationController
  include DomainIdentities

  before_action :set_campaign, only: [:join, :edit, :show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def join
  end
  
  def index
    @campaigns = Campaign.all
    @campaigns = @campaigns.paginate(page: params[:campaigns_page], per_page: 10)
    puts "HEREHHERHERHEHREHR----------------------------------------------"
  end

  def show
    @user = setUser
    @dash = setDash

    # Old listings
    @ccountries = @campaign.campcounts.paginate(page: params[:countries_paginate], per_page: 5)
    @players = @campaign.players.paginate(page: params[:players_paginate], per_page: 5)
  end

  def new
    @dash = setDash
    @campaign =  @dash.campaigns.build
  end

  def edit
  end

  def create
  @dash = setDash
    # @campaign = @dash.campaigns.create!(campaign_params)  # works v1
# User.second.dashes.first.campaigns.create(name: "blah2")
    respond_to do |format|
      # if @campaign.save  # works v1
      if @campaign = @dash.campaigns.create!(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
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

    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
  def set_user
    @user = User.find(current_user.id)
  end
  
  def set_campaign
    # @campaign = Campaign.find(params[:id])
    @campaign = Campaign.find(params[:id])
  end

    def campaign_params
      params.require(:campaign).permit(:name, :description, :player_id)
    end
end
