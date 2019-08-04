Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  root to: 'users#new'

  get 'signin', to: 'sessions#new'

  post 'signin', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :attractions, only: [:new, :create, :edit, :update, :index, :show]

  resources :rides, only: [:create]
  
end
