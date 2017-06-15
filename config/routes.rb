Rails.application.routes.draw do
  
  root 'pages#home'
  get '/about', to: 'pages#about'

  resources :articles

  get '/signup', to: 'users#new'
  #get '/users', to: 'users#create'
  
  resources :users
end
