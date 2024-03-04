Rails.application.routes.draw do
  get 'sessions/create'

  resources :animes do
    member do
      post 'add_genre/:genre_id', to: 'animes#add_genre_to_anime', as: 'add_genre'
      post 'add_genres', to: 'animes#add_genres', as: 'add_genres'
    end
  end
  resources  :users

#Review with Comments
resources :reviews, only: [:create, :show, :update, :destroy]

#Create Comments Route
resources :comments, only: [:create, :update, :destroy]

#Create/Update Genres
resources :genres

#Person Profile
resources :people, only: [:create, :show, :update, :destroy]


 #Profile Routes 
  get 'profiles/:username', to: 'profiles#show', as: :profile

 #AnimeList Routes 
  get 'animelist/:username', to: 'anime_lists#show', as: :anime_list
  resources :anime_lists, only: [:create, :update, :destroy]

 #Session Routes
 post '/login', to: 'sessions#create'

end
  