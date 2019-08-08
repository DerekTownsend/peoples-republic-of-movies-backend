class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :mpaa_rating, :released_date, :director, :writer, :plot, :language, :country, :poster_url, :producer
end
