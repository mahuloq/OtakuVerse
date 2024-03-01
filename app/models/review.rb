class Review < ApplicationRecord
enum recommend: {
  recommend: 0,
  mixed_feelings: 1,
  do_not_recommend: 2
}


#Validations
  validates :user_id, presence: true 
  validates :anime_id, presence: true 
  validates :content, presence: true 

#Associations  
  belongs_to :user
  belongs_to :anime

  has_many :comments
end
