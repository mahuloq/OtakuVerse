FactoryBot.define do
  factory :person do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    bio {Faker::Lorem.paragraph}
  end
end
