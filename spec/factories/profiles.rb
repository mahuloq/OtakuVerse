FactoryBot.define do
  factory :profile do

    association :user
    bio {Faker::JapaneseMedia::OnePiece.quote}

end
  end

