class LikesController < ApplicationController
  def create
    like = Like.create(like_params)
    render json: MovieSerializer.new(like.comment.movie).to_serialized_json
  end

  def destroy
    like = Like.find_by(id: params[:id])
    movie = like.comment.movie
    like.destroy
    render json: MovieSerializer.new(movie).to_serialized_json
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :comment_id)
  end
end
