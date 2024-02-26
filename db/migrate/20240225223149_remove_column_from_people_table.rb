class RemoveColumnFromPeopleTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :people, :nationality, :string
  end
end
