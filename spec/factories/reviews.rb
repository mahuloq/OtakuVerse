FactoryBot.define do
  factory :review do
    association :user
    association :anime
    content { "This is a sample review text." }
  end
end