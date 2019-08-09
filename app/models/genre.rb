class Genre < ApplicationRecord
  has_many :genre_movies
  has_many :movies, through: :genre_movies
end
