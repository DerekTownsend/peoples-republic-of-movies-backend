class User < ApplicationRecord
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :movie_comments, through: :comments, source: :movie
  has_many :movie_ratings, through: :ratings, source: :movie
  has_many :movie_favorites, through: :favorites, source: :movie
  has_many :liked_comments, through: :likes, source: :comment

end
