class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def profile
    user = current_user
    render json: UserSerializer.new(user).to_serialized_json, status: :accepted
  end

  def create
    # user = User.new(user_params)
    # puts user
    user = User.create(user_params)

    if user.valid?
      token = encode_token(user_id: user.id)
      render json: UserSerializer.new(user, token).to_serialized_json, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def favorite_movies
    page = params["page"]
    page = page.to_i
    ending_page = page*24
    starting_page = ending_page-24

    user = current_user

    movies_max = user.movie_favorites.count
    movies = user.movie_favorites[starting_page...ending_page]

    render json:  MovieSerializer.new(movies, movies_max).to_serialized_json
  end

  def comments
    page = params["page"]
    page = page.to_i
    ending_page = page*24
    starting_page = ending_page-24

    user = current_user

    comments_max = user.comments.count
    comments = user.comments[starting_page...ending_page]

    render json:  CommentSerializer.new(comments, comments_max).to_serialized_json
  end

  def ratings
    page = params["page"]
    page = page.to_i
    ending_page = page*24
    starting_page = ending_page-24

    user = current_user
    ratings_max = user.ratings.count
    ratings = user.ratings[starting_page...ending_page]

    render json:  RatingSerializer.new(ratings, ratings_max).to_serialized_json
  end

  private
  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :admin)
  end

end
