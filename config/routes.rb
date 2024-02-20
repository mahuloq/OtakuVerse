Rails.application.routes.draw do

  resources  :animes
  resources  :users
  get 'profiles/:username', to: 'profiles#show', as: :profile
  get 'animelist/:username', to: 'anime_lists#show', as: :anime_list
  resources :anime_lists, only: [:create, :update, :destroy]
end
  