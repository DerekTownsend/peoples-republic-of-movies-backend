class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :ratings
  has_many :favorites
  has_many :likes
  has_many :movie_comments, through: :comments, source: :movie
  has_many :movie_ratings, through: :ratings, source: :movie
  has_many :movie_favorites, through: :favorites, source: :movie
  has_many :liked_comments, through: :likes, source: :comment

end
