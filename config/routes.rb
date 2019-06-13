Rails.application.routes.draw do

  resources :users
  
  get '/signup', to:'users#new'
  
  post 'signup', to:"users#create"

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
