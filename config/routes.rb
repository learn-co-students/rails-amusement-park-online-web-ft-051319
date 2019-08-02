Rails.application.routes.draw do
  resources :users
  resources :attractions
  root to: 'users#welcome'

  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#authenticate'
  get '/logout', to: 'users#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
