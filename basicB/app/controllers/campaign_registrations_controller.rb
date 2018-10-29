load 'app/classes/Enroller.rb'
# require 'app/classes/Enroller.rb'

class CampaignRegistrationsController < ApplicationController
  before_action :set_campaign_registration, only: [:show, :edit, :update, :destroy]

  # GET /campaign_registrations
  # GET /campaign_registrations.json
  def index
    @campaign_registrations = CampaignRegistration.all
  end

  # GET /campaign_registrations/1
  # GET /campaign_registrations/1.json
  def show
  end

  def new
    @campaign_registration = CampaignRegistration.new
  end

  # GET /campaign_registrations/1/edit
  def edit
    # @player = Player.find(@campaign_registration.player.id)
  end

  # PATCH/PUT /campaign_registrations/1
  # PATCH/PUT /campaign_registrations/1.json
  def update
    respond_to do |format|
      if @campaign_registration.update(campaign_registration_params)
        format.html { redirect_to @campaign_registration, notice: 'Campaign registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign_registration }
      else
        format.html { render :edit }
        format.json { render json: @campaign_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_registrations/1
  # DELETE /campaign_registrations/1.json
  def destroy
    @campaign_registration.destroy
    respond_to do |format|
      format.html { redirect_to campaign_registrations_url, notice: 'Campaign registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
    # POST /campaign_registrations
  # POST /campaign_registrations.json
  def create
    @campaign_registration = CampaignRegistration.new
    
    @enroller = Enroller::Enroller.new(params[:campaign_id], current_user.id)
    # Execute the class to generate defaults & the relationships linking it all
    @enroller.enrolling
    
    # capture enroller's output for cofirmation use
    # some of these look like they might be nested in the strong_params
    @campaign_registration[:user_id] = @enroller.info[:user].id
    @campaign_registration[:dash_id] = @enroller.info[:dashboard].id
    @campaign_registration[:campaign_id] = @enroller.info[:campaign].id
    @campaign_registration[:player_id] = @enroller.result[:player].id
    @campaign_registration[:country_id] = @enroller.result[:organization].id

    respond_to do |format|
      if @campaign_registration.save
        
        format.html { redirect_to @campaign_registration, notice: 'Campaign registration was successfully created.' }
        format.json { render :show, status: :created, location: @campaign_registration }
      else
        format.html { render :new }
        format.json { render json: @campaign_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_registration
      @campaign_registration = CampaignRegistration.find(params[:id])
    end

    # TODO - check if these should be nested or not against model - as enroller object in the create action doesn't nest
    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_registration_params
      params.require(:campaign_registration).permit(
        :campaign_id, :user_id, :dash_id, :player_id, :country_id,
        player_attributes: [:id, :name],
        country_attributes: [:id, :name])
    end
end
