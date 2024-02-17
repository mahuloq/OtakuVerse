class Review < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  has_many :comments
end
