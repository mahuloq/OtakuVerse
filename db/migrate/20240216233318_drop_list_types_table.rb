class DropListTypesTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :list_types
  end
end
