require "rails_helper"
# spec/models/user_spec.rb

RSpec.describe User, type: :model do
    describe "validations" do
      it "is valid with valid attributes" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
  
      it "is invalid without a username" do
        user = FactoryBot.build(:user, username: nil)
        expect(user).not_to be_valid
      end
  
      it "is invalid without an email" do
        user = FactoryBot.build(:user, email: nil)
        expect(user).not_to be_valid
      end
  
      it "is invalid with an invalid email format" do
        user = FactoryBot.build(:user, email: "invalidemail")
        expect(user).not_to be_valid
      end
  
      it "is invalid with a duplicate email" do
        existing_user = FactoryBot.create(:user)
        user = FactoryBot.build(:user, email: existing_user.email)
        expect(user).not_to be_valid
      end
  
      it "is invalid without a password" do
        user = FactoryBot.build(:user, password_digest: nil)
        expect(user).not_to be_valid
      end
  
      it 'hashes the password' do
        user = create(:user, password: 'password')
        expect(user.password_digest).not_to eq 'password'
      end    

      it "is invalid with a password shorter than the minimum length" do
        user = FactoryBot.build(:user, password: "short")
        expect(user).not_to be_valid
      end
    end
  end

  RSpec.describe User, type: :model do
    describe "associations" do
      it "has many anime_lists" do
        user = FactoryBot.create(:user)
        expect(user).to respond_to(:anime_lists)
      end
  
      it "has many animes through anime_lists" do
        user = FactoryBot.create(:user)
        expect(user).to respond_to(:animes_listed)
      end
  
      it "has many reviews" do
        user = FactoryBot.create(:user)
        expect(user).to respond_to(:reviews)
      end
  
      it "has many ratings" do
        user = FactoryBot.create(:user)
        expect(user).to respond_to(:ratings)
      end
    end
  end
  
  


