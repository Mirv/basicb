class Api::V1::CountriesController < Api::V1::BaseController
  def show
    country = Country.find(params[:id])

    render(json: Api::V1::CountrySerializer.new(country).to_json)
  end
  
  def index
    countries = Country.all

    render(
      json: ActiveModel::Serializer::CollectionSerializer.new(
        countries,
        # each_serializer: Api::V1::CountrySerializer,
        serializer: Api::V1::CountrySerializer,
        root: 'countries',
      )
    )
  end
end