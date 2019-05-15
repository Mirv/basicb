require 'DomainIdentities.rb'

class DashesController < ApplicationController

  before_action :set_dash, only: [:show, :dashboard, :edit, :update, :destroy]

  def dashboard
    @user = set_user
    @my_dash = set_dash
    
    @players = @my_dash.players.paginate(page: params[:page], per_page: 5)
    @dash_hosting = @my_dash.campaigns
  end
    
  def index
    @dashes_list = Dash.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @dash = Dash.new
  end

  def edit
  end

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

  def update
    respond_to do |format|
      if @dash.update!(dash_params)
        format.html { redirect_to @dash, notice: 'Dash was successfully updated.' }
        format.json { render :show, status: :ok, location: @dash }
      else
        format.html { render :edit }
        format.json { render json: @dash.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    respond_to do |format|
      if @dash.destroy!
        format.html { redirect_to dashes_url, notice: "Dash was successfully destroyed."}
        format.json { head :no_content }
      else
        format.html { redirect_to dashes_url, notice: 'Dash failed to be destroyed.' }
        format.json { head :no_content } 
      end
    end
  end

  private
  
    def set_user
      @user = current_user || User.find(params[:id])
    end
    
    def set_dash
      @dash = current_user.dashes.first || Dash.create!()
    end

    def dash_params
      params.require(:dash).permit(:id, :name, :dashcampaigns_id, :dashplayers_id) #pulled user_id for player_controller test
    end
end
