FactoryBot.define do
  factory :cast_and_crew do
    association :person
    association :anime
    role { Faker::Lorem.words(number: 3).join(' ') }
    character {Faker::JapaneseMedia::OnePiece.character}
  end
end
