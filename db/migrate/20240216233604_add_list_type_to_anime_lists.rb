class AddListTypeToAnimeLists < ActiveRecord::Migration[7.1]
  def change
    add_column :anime_lists, :list_type, :integer
  end
end
