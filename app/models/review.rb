class Review < ApplicationRecord

#Validations
  validates :user_id, presence: true 
  validates :anime_id, presence: true 
  validates :content, presence: true 

#Associations  
  belongs_to :user
  belongs_to :anime

  has_many :comments
end
