class CreateAnimes < ActiveRecord::Migration[7.1]
  def change
    create_table :animes do |t|
      t.string :english_title
      t.string :romanji_title
      t.date :start_air_date
      t.date :end_air_date
      t.integer :number_of_episodes
      t.text :description
      t.string :season
      t.string :studio
      t.string :source
      t.string :duration
      t.string :age_rating

      t.timestamps
    end
  end
end
