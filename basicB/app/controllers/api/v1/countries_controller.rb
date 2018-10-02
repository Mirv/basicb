class Api::V1::CountriesController < Api::V1::BaseController
  def show
    country = Country.find(params[:id])

    render(json: Api::V1::CountrySerializer.new(country).to_json)
  end
end