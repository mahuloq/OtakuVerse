FactoryBot.define do
    factory :user do
      username { Faker::Internet.unique.username }
      email { Faker::Internet.unique.email }
      password { 'password' }
      password_confirmation {'password'}
    end
  end
  