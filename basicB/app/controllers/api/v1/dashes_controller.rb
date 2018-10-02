class Api::V1::DashesController < Api::V1::BaseController
  def show
    dash = Dash.find(params[:id])

    render(json: Api::V1::DashSerializer.new(dash).to_json)
  end
  
  def index
    dashes = Dash.all

    render(
      json: ActiveModel::ArraySerializer.new(
        dashes,
        each_serializer: Api::V1::DashSerializer,
        root: 'dashes',
      )
    )
  end
end