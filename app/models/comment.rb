class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user

end
