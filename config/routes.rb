Rails.application.routes.draw do

  resources  :animes
  resources  :users
  get 'profiles/:username', to: 'profiles#show', as: :profile
  get 'animelists/:username', to: 'anime_lists#show', as: :anime_list

end
  