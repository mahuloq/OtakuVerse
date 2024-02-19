# Create sample data for your models
10.times do
  # Create a user with associated profile
  user = FactoryBot.create(:user)
  profile = FactoryBot.create(:profile, user: user)

  # Create an anime with associated genres and people through cast and crew
  anime = FactoryBot.create(:anime)
  genres = FactoryBot.create_list(:genre, 3)
  people = FactoryBot.create_list(:person, 5)
  anime.genres << genres
  anime.people << people

  # Create an anime list for the user
  anime_list = FactoryBot.create(:anime_list, user: user, anime: anime)

  # Create a review associated with the user, anime, and comments
  review = FactoryBot.create(:review, user: user, anime: anime)
  FactoryBot.create_list(:comment, 3, review: review, user: user)

  # Create a rating associated with the user and anime
  FactoryBot.create(:rating, user: user, anime: anime)

  2.times do
    other_user = FactoryBot.create(:user)
    other_profile = FactoryBot.create(:profile, user: other_user)
    other_review = FactoryBot.create(:review, user: other_user, anime: anime)
    FactoryBot.create_list(:comment, 3, review: other_review, user: other_user)

    # Create comments on the original review
    FactoryBot.create(:comment, review: review, user: other_user)
  end
end
