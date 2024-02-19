FactoryBot.define do
  factory :rating do
    association :user
    association :anime
    score { rand(1..10) }
  end
end



