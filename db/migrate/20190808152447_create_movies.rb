class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :mpaa_rating
      t.date :released_date
      t.string :director
      t.string :writer
      t.text :plot
      t.string :language
      t.string :country
      t.string :poster_url
      t.string :producer

      t.timestamps
    end
  end
end
