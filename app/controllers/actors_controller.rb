class ActorsController < ApplicationController
  def show
      actor = Actor.find_by(id: params[:id])
      movies = actor.movies
      movies_max = movies.count
    # total: Movie.all.count

    movies = JSON.parse(MovieSerializer.new(movies.to_a, movies_max).to_serialized_json)["movies"]
    # p movies["movies"]
    render json:  {actor: actor, movies: movies}
  end
end
