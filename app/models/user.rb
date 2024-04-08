class User < ApplicationRecord

#Validation
    has_secure_password
  
after_create :create_default_profile

    validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 30}
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 8, maximum: 128 }
    validates :password_confirmation, presence: true


#Associations 
    has_one :profile, dependent: :destroy
    has_many :comments
    has_many :reviews
    has_many :ratings
    has_many :anime_lists, dependent: :destroy
    has_many :animes_listed, through: :anime_lists, source: :anime
    has_many :animes_rated, through: :ratings, source: :anime
    has_many :animes_reviewed, through: :reviews, source: :anime

    private 
    
    def validate_username
        unless username =~ /\A[a-zA-Z0-9_]+\Z/
            errors.add(:username, "can only contain letters, numbers, and underscores, and must include one letter or number")
        end 
    end
   
    def create_default_profile
        self.create_profile(bio: 'Default bio')
      end
  end
  