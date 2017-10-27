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

  # GET /campaign_registrations/new
  def new
    # Execute the class to generate defaults & the relationships linking it all
    @enroller = Enroller::Enroller.new(params[:campaign_id], current_user.id)
    @enroller.enrolling

      # if @enroller.result
      #   user_id
      #   dash_id
      #   campaign_id
      #   player_id
      #   country_id
        
      # else
      #   format.html { redirect_to campaigns_url, notice: "Failed to join!" }
      #   format.json { render json: @country.errors, status: :unprocessable_entity }
      # end
    @campaign_registration = CampaignRegistration.new
    @campaign_registration[:player_id] = @enroller.result[:player].id
    @campaign_registration[:country_id] = @enroller.result[:organization].id
  end

  # GET /campaign_registrations/1/edit
  def edit
  end

  # POST /campaign_registrations
  # POST /campaign_registrations.json
  def create
    @campaign_registration = CampaignRegistration.new(campaign_registration_params)

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_registration
      @campaign_registration = CampaignRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_registration_params
      params.require(:campaign_registration).permit(
          :campaign_id, :user_id, :dash_id,
          countries_attributes: [:id, :name, :description, :size],
          players_attributes: [:id,:screenname, :country_id, :motto])
    end
end
