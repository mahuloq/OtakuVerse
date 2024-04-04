class AddDefaultToListTypeInAnimeLists < ActiveRecord::Migration[7.1]
  def change
  change_column_default :anime_lists, :list_type, from: nil, to: 0
  end
end
