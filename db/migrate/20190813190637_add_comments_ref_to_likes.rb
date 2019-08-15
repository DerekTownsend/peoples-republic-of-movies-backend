class AddCommentsRefToLikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :comment, foreign_key: true
  end
end
