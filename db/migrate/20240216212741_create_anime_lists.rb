class CreateAnimeLists < ActiveRecord::Migration[7.1]
  def change
    create_table :anime_lists do |t|
      t.references :anime, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :list_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
