class GenresController < ApplicationController
  def show
    genre = Genre.find_by(id: params[:id])
    page = params["page"]
    page = page.to_i
    ending_page = page*24
    starting_page = ending_page-24
    movies = genre.movies
    movies_max = movies.count
    
    if movies
      movies = movies[starting_page...ending_page]
      p movies
      movies = JSON.parse(MovieSerializer.new(movies.to_a, movies_max).to_serialized_json)
      render json:  {genre: genre, movies: movies}
    else
      render json: {movies: []}
    end
    # total: Movie.all.count

    # movies = JSON.parse(MovieSerializer.new(movies.to_a, movies_max).to_serialized_json)["movies"]
    # p movies["movies"]
  end
end
