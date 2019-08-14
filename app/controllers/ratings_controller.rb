class RatingsController < ApplicationController
  def create
    rating = Rating.create(rating_params)
    render json: MovieSerializer.new(rating.movie).to_serialized_json
  end

  def update
    rating = Rating.find_by(id: params[:id])
    rating.update_attributes(rating_params)
    render json: MovieSerializer.new(rating.movie).to_serialized_json
  end
  
  def destroy
    rating = Rating.find_by(id: params[:id])
    movie = rating.movie
    rating.destroy
    render json: MovieSerializer.new(movie).to_serialized_json
  end


  private
  def rating_params
    params.require(:rating).permit(:amount, :user_id, :movie_id)
  end
end
