class CreateCastAndCrews < ActiveRecord::Migration[7.1]
  def change
    create_table :cast_and_crews do |t|
      t.references :anime, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :role
      t.string :character

      t.timestamps
    end
  end
end
