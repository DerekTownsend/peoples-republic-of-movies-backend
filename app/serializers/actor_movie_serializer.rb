class ActorMovieSerializer < ActiveModel::Serializer
  attributes :id
  has_one :actor
  has_one :movie
end
