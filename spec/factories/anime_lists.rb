FactoryBot.define do
  factory :anime_list do
    association :user
    association :anime
    list_type { rand(0..4) }
    start_date { Faker::Date.between(from: 10.years.ago, to: Date.today) }
    end_date { |anime_list| anime_list.start_date + rand(1..365).days }  
    episodes_watched { rand(1..50) }
    
    trait :with_custom_dates do
      start_date { Faker::Date.between(from: 10.years.ago, to: Date.today) }
      end_date { |anime_list| anime_list.start_date + rand(1..365).days }
    end
  end
end
