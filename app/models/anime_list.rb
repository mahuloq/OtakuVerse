class AnimeList < ApplicationRecord
enum list_type: {
  plan_to_watch: 0,
  watching: 1,
  completed: 2, 
  on_hold: 3,
  dropped: 4
}

#Validations
validates :anime_id, presence: true
validates :user_id, presence: true
validates :list_type, presence: true

#Associations  
  belongs_to :anime
  belongs_to :user
end
