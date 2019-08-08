class GenreMovieSerializer < ActiveModel::Serializer
  attributes :id
  has_one :genre
  has_one :movie
end
