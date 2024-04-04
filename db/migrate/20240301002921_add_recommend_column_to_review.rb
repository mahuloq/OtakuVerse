class AddRecommendColumnToReview < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :recommend, :integer, default: 0
  end
end
