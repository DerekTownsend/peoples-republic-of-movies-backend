class RemoveMovieRefFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :likes, :movies

  end
end
