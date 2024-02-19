class Profile < ApplicationRecord

#Validations
  validates :user_id, presence: true  


#Associations  
  belongs_to :user
end
