Rails.application.routes.draw do
  get 'sessions/create'

  resources  :animes
  resources  :users

#Review with Comments
resources :reviews, only: [:create, :show, :update, :destroy]

#Create Comments Route
resources :comments, only: [:create, :update, :destroy]

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
  