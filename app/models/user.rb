class User < ApplicationRecord

#Validation
    has_secure_password
  
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 8, maximum: 128 }
    validates :password_confirmation, presence: true


#Associations 
    has_one :profile
    has_many :comments
    has_many :reviews
    has_many :ratings
    has_many :anime_lists
    has_many :animes_listed, through: :anime_lists, source: :anime
    has_many :animes_rated, through: :ratings, source: :anime
    has_many :animes_reviewed, through: :reviews, source: :anime
  end
  