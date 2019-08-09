class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_one :user
  has_one :movie
end
