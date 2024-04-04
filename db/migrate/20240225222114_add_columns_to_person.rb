class AddColumnsToPerson < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :birthday, :date
    add_column :people, :website, :string
    add_column :people, :alternate_names, :string
    add_column :people, :more, :text
    add_column :people, :language, :string
  end
end
