Rails.application.routes.draw do
  resources :tracks
  resources :albums
  resources :bands
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
