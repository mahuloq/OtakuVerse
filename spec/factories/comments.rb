FactoryBot.define do
  factory :comment do
    association :user
    association :review
    content {Faker::Lorem.paragraph}
  end
end
