class RemoveMovieColumnFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :movie_id
  end
end
