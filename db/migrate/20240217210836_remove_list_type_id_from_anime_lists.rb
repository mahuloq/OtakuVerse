class RemoveListTypeIdFromAnimeLists < ActiveRecord::Migration[7.1]
  def change
    remove_column :anime_lists, :list_type_id, :integer
  end
end
