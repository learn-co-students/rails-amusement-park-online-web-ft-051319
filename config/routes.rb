Rails.application.routes.draw do
#  get 'attractions/new'
  get 'sessions/new'
  root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :new, :create, :edit, :update, :destroy] 

  resources :attractions, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  post '/logout' => "sessions#destroy"


end
