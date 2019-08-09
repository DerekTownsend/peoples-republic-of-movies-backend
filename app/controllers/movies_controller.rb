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
end
