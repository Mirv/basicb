# Not actually using yet - created for DRY purpose later
class CampaignRegistriesController < ApplicationController
  before_action :set_campaign_registry, only: [:show, :edit, :update, :destroy]

  # GET /campaign_registries
  # GET /campaign_registries.json
  def index
    @campaign_registries = CampaignRegistry.all
  end

  # GET /campaign_registries/1
  # GET /campaign_registries/1.json
  def show
  end

  # GET /campaign_registries/new
  def new
    @campaign_registry = CampaignRegistry.new
  end

  # GET /campaign_registries/1/edit
  def edit
  end

  # POST /campaign_registries
  # POST /campaign_registries.json
  def create
    @campaign_registry = CampaignRegistry.new(campaign_registry_params)

    respond_to do |format|
      if @campaign_registry.save
        format.html { redirect_to @campaign_registry, notice: 'Campaign registry was successfully created.' }
        format.json { render :show, status: :created, location: @campaign_registry }
      else
        format.html { render :new }
        format.json { render json: @campaign_registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_registries/1
  # PATCH/PUT /campaign_registries/1.json
  def update
    respond_to do |format|
      if @campaign_registry.update!(campaign_registry_params)
        format.html { redirect_to @campaign_registry, notice: 'Campaign registry was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign_registry }
      else
        format.html { render :edit }
        format.json { render json: @campaign_registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_registries/1
  # DELETE /campaign_registries/1.json
  def destroy
    @campaign_registry.destroy
    respond_to do |format|
      format.html { redirect_to campaign_registries_url, notice: 'Campaign registry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_registry
      @campaign_registry = CampaignRegistry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_registry_params
      params.require(:campaign_registry).permit(:campaign_id, :user_id, :dash_id, :user_id)
    end
end
