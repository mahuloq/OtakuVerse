class AddUniqueIndexToAnimesGenres < ActiveRecord::Migration[7.1]
  def change
    add_index :animes_genres, [:anime_id, :genre_id], unique: true
  end
end
