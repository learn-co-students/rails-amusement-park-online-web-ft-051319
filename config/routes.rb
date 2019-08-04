Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  root to: 'users#new'

  get 'signin', to: 'sessions#new'

  post 'signin', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :attractions, only: [:new, :create, :index, :show]
  
end
