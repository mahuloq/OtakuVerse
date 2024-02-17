class Genre < ApplicationRecord

#Associations
    has_and_belongs_to_many :animes
end
