class CreateGenreMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_movies do |t|
      t.references :genre, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
