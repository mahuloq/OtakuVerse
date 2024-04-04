10.times do
  # Create a user and profile
  user = FactoryBot.create(:user)
  profile = FactoryBot.create(:profile, user: user)

  # Create an anime with genres
  anime = FactoryBot.create(:anime)
  genres = FactoryBot.create_list(:genre, 3)
 
  anime.genres << genres


  # Create an anime list for the user
  anime_list = FactoryBot.create(:anime_list, user: user, anime: anime)

  # Create a review with the user, anime, and comments
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
  5.times do
    FactoryBot.create(:cast_and_crew, person: FactoryBot.create(:person), anime: anime)

  end
end
