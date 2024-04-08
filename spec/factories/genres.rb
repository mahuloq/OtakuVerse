FactoryBot.define do
  factory :genre do
    name {Faker::Book.unique.genre}
    description {Faker::Lorem.sentence}
  end
end
