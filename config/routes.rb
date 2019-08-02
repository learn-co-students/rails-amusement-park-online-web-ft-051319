Rails.application.routes.draw do
  root 'users#new'
  resources :users
  resources :attractions 
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
