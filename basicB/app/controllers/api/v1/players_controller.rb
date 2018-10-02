class Api::V1::PlayersController < Api::V1::BaseController
  def show
    player = Player.find(params[:id])

    render(json: Api::V1::PlayerSerializer.new(player).to_json)
  end
end