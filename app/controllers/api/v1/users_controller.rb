# require 'active_model/array_serializer'

class Api::V1::UsersController < Api::V1::BaseController
  def show
    user = User.find(params[:id])

    render(json: Api::V1::UserSerializer.new(user).to_json)
  end
  # byebug
  
  def index
    users = User.all
# byebug
    render(
      json: ActiveModel::Serializer::CollectionSerializer.new(
        users,
        # each_serializer: Api::V1::UserSerializer,
        # each_serializer: UserSerializer,
        # root: 'users',
        serializer: UserSerializer,
      )
    )
  end
end