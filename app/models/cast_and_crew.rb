class CastAndCrew < ApplicationRecord
#Validations
  validates :role, presence: true
  validates :anime_id, presence: true
  validates :person_id, presence: true

#Associations 
  belongs_to :anime
  belongs_to :person
end
