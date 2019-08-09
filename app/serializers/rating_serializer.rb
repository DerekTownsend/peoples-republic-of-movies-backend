class RatingSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :user
  has_one :movie
end
