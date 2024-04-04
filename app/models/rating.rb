class Rating < ApplicationRecord

#Validations
  validates :user_id, presence: true
  validates :anime_id, presence: true
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

#Associations
  belongs_to :user
  belongs_to :anime
end
