class FavoritesController < ApplicationController
  def create
    favorite = Favorite.create(favorite_params)
    render json: UserSerializer.new(favorite.user).to_serialized_json
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    user = favorite.user
    favorite.destroy
    render json: UserSerializer.new(user).to_serialized_json
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :movie_id)
  end

end
