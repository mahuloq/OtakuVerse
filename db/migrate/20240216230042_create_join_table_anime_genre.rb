class CreateJoinTableAnimeGenre < ActiveRecord::Migration[7.1]
  def change
    create_join_table :animes, :genres do |t|
      # t.index [:anime_id, :genre_id]
      # t.index [:genre_id, :anime_id]
    end
  end
end
