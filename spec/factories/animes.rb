FactoryBot.define do
  factory :anime do
    english_title { Faker::Lorem.words(number: 2).join(" ") }
    romanji_title { Faker::Lorem.words(number: 2).join(" ") }
    start_air_date { Faker::Date.between(from: 10.years.ago, to: Date.today) }
    number_of_episodes { Faker::Number.between(from: 1, to: 100) }
    description { Faker::Lorem.paragraph }
    season { Faker::Lorem.word }
    studio { Faker::Company.name }
    source { Faker::Lorem.word }
    duration { Faker::Lorem.word }
    age_rating { Faker::Lorem.word }
  end
end