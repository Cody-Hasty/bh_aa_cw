Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:index, :show, :new, :create, :update, :destroy]

  resources :posts, only: [:edit, :new, :update, :create, :destroy]

  resources :subs, only: [:edit, :new, :update, :create ,:index, :show]
  resources :posts, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
