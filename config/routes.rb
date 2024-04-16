Rails.application.routes.draw do
  get 'sessions/create'

  resources :animes do
    member do
      post 'add_genre/:genre_id', to: 'animes#add_genre_to_anime', as: 'add_genre'
      post 'add_genres', to: 'animes#add_genres', as: 'add_genres'
      post 'upload_image', to: 'animes#upload_image'
      post 'upload_cover', to: 'animes#upload_cover_photo'
    end
  end
  resources :users do
    post 'upload_image', to: 'users#upload_image'
  end

  # Search Route
  get '/api/searchPerson', to: 'search#searchPerson'
  get '/api/searchGenre', to: 'search#searchGenre'

  # Create a new cast entry
  resources :cast_and_crew do
    collection do
      get :fullCrew
    end
  end

  # Review with Comments
  resources :reviews, only: [:create, :show, :update, :destroy]

  # Create Comments Route
  resources :comments, only: [:create, :update, :destroy]

  # Create/Update Genres
  resources :genres

  # Person Profile
  resources :people, only: [:create, :show, :update, :destroy]

  # Profile Routes
  get 'profiles/:username', to: 'profiles#show', constraints: { username: /.*/ }

  # AnimeList Routes
  get 'animelist/:username', to: 'anime_lists#show'
  resources :anime_lists, only: [:create, :update, :destroy]

  # Session Routes
  post '/login', to: 'sessions#create'
  end
