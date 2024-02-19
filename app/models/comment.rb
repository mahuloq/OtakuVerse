class Comment < ApplicationRecord
#Validations
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :content, presence: true

#Associations 
  belongs_to :user
  belongs_to :review
end
