
class Anime < ApplicationRecord


#Validations
    validates :english_title, presence: true
    validates :romanji_title, presence: true
    validates :start_air_date, presence: true
    validates :number_of_episodes, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
    
#Associations  
    has_many :reviews 
    has_many :ratings
    has_many :anime_lists
    has_many :cast_and_crews
    has_and_belongs_to_many :genres
    has_many :users_listed, through: :anime_lists, source: :user
    has_many :users_rated, through: :ratings, source: :user
    has_many :users_reviewed, through: :reviews, source: :user
    has_many :people, through: :cast_and_crews
  end
  