class Profile < ApplicationRecord

#Validations
  validates :user_id, presence: true

# Methods
def profile_photo_url
  rails_blob_url(self.profile_photo, only_path: false) if self.profile_photo.attached?
end

#Associations  
  belongs_to :user
  has_one_attached :profile_photo
end
