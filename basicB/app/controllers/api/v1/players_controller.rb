class Api::V1::PlayersController < Api::V1::BaseController
  def show
    player = Player.find(params[:id])

    render(json: Api::V1::PlayerSerializer.new(player).to_json)
  end
  
    def index
    players = Player.all
    render(
      json: ActiveModel::Serializer::CollectionSerializer.new(
        players,
        # each_serializer: Api::V1::UserSerializer,
        # each_serializer: UserSerializer,
        # root: 'users',
        serializer: PlayerSerializer,
      )
    )
  end
end