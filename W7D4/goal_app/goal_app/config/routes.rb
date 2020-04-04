Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  resources :goals, only: [:new, :create, :show, :index]
end
