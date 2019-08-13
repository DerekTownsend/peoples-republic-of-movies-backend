class MoviesController < ApplicationController
  # skip_before_action :authorized, only: [:index]

  def index
    page = params["page"]
    if page
      page = page.to_i
      ending_page = page*24
      starting_page = ending_page-24
      movies = Movie.all[starting_page...ending_page]
    else
      movies = Movie.all
    end
    # total: Movie.all.count
    render json:  MovieSerializer.new(movies).to_serialized_json
  end

  def show
      movie = Movie.find_by(id: params[:id])

    # total: Movie.all.count
    render json:  MovieSerializer.new(movie).to_serialized_json
  end

  def search
    page = params["page"]
    page = page.to_i
    ending_page = page*24
    starting_page = ending_page-24

    movies = Movie.all.select do |movie|
      if movie.title.downcase.include?(params[:term].downcase)
        movie
      end
    end

    if movies
      movies_max = movies.count
      movies = movies[starting_page...ending_page]
      render json:  MovieSerializer.new(movies, movies_max).to_serialized_json
    else
      render json: {movies: []}
    end
  end
end
