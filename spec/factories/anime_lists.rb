FactoryBot.define do
  factory :anime_list do
    association :user
    association :anime
    list_type {rand(0..4)}
  end
end
