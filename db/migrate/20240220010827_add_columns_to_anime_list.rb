class AddColumnsToAnimeList < ActiveRecord::Migration[7.1]
  def change
    add_column :anime_lists, :start_date, :date
    add_column :anime_lists, :end_date, :date
    add_column :anime_lists, :episodes_watched, :integer
  end
end
