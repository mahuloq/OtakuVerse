class RemoveForeignKeyFromAnimeLists < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :anime_lists, :list_types
  end
end
