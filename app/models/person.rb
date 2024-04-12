class Person < ApplicationRecord
# Validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    

#Associations
    has_one_attached :headshot
    has_many :cast_and_crews
    has_many :animes, through: :cast_and_crews

end
