class Genre < ApplicationRecord
#Validations
    validates :name, presence: true
    validates :description, presence: true

#Associations
    has_and_belongs_to_many :animes
end
