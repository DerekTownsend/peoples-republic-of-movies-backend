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

    render json: {movies: movies, total: Movie.all.count}
  end
end
