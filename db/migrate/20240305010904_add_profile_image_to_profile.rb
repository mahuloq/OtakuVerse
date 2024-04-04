class AddProfileImageToProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :favorites, :text
  end
end
