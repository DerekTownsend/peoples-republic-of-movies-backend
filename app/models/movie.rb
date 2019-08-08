class Movie < ApplicationRecord
  has_many :actor_movies
  has_many :genre_movies
  has_many :comments
  has_many :ratings
  has_many :favorites
  has_many :actors, through: :actor_movies
  has_many :genres, through: :genre_movies
  has_many :user_comments, through: :comments, source: :user
  has_many :user_ratings, through: :ratings, source: :user
  has_many :user_favorites, through: :favorites, source: :user
end
