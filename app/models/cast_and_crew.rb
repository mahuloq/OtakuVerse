class CastAndCrew < ApplicationRecord
#Validations
  validates :role, presence: true

#Associations 
  belongs_to :anime
  belongs_to :person
end
