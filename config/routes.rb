Rails.application.routes.draw do
  resources :rides
  resources :users
  resources :attractions
  root 'users#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  post '/users/:id' => 'users#show'

end
