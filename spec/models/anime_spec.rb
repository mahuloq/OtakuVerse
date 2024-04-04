RSpec.describe Anime, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      anime = FactoryBot.build(:anime)
      expect(anime).to be_valid
    end

    it "is not valid without an english title" do
      anime = FactoryBot.build(:anime, english_title: nil)
      expect(anime).not_to be_valid
    end

    it "is not valid without a romanji title" do
      anime = FactoryBot.build(:anime, romanji_title: nil)
      expect(anime).not_to be_valid
    end

    it "is not valid without a start air date" do
      anime = FactoryBot.build(:anime, start_air_date: nil)
      expect(anime).not_to be_valid
    end

    it "is not valid without a number of episodes" do
      anime = FactoryBot.build(:anime, number_of_episodes: nil)
      expect(anime).not_to be_valid
    end

    it "is not valid with a negative number of episodes" do
      anime = FactoryBot.build(:anime, number_of_episodes: -1)
      expect(anime).not_to be_valid
    end
  end

  describe "associations" do
    it "has many reviews" do
      association = described_class.reflect_on_association(:reviews)
      expect(association.macro).to eq(:has_many)
    end

    it "has many ratings" do
      association = described_class.reflect_on_association(:ratings)
      expect(association.macro).to eq(:has_many)
    end

    it "has many anime_lists" do
      association = described_class.reflect_on_association(:anime_lists)
      expect(association.macro).to eq(:has_many)
    end

    it "has many cast_and_crews" do
      association = described_class.reflect_on_association(:cast_and_crews)
      expect(association.macro).to eq(:has_many)
    end

    it "has and belongs to many genres" do
      association = described_class.reflect_on_association(:genres)
      expect(association.macro).to eq(:has_and_belongs_to_many)
    end

    it "has many users_listed through anime_lists" do
      association = described_class.reflect_on_association(:users_listed)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:anime_lists)
    end

    it "has many users_rated through ratings" do
      association = described_class.reflect_on_association(:users_rated)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:ratings)
    end

    it "has many users_reviewed through reviews" do
      association = described_class.reflect_on_association(:users_reviewed)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:reviews)
    end

    it "has many people through cast_and_crews" do
      association = described_class.reflect_on_association(:people)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:cast_and_crews)
    end

    it "has many users_reviewed through reviews" do
      expect(described_class.reflect_on_association(:users_reviewed).macro).to eq(:has_many)
      expect(described_class.reflect_on_association(:users_reviewed).options[:through]).to eq(:reviews)
    end

    it "returns the users who have reviewed the anime" do
      anime = FactoryBot.create(:anime)
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      review1 = FactoryBot.create(:review, anime: anime, user: user1)
      review2 = FactoryBot.create(:review, anime: anime, user: user2)

      expect(anime.users_reviewed).to include(user1, user2)
    end
  end
end
