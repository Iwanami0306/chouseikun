Rails.application.routes.draw do
  
  post '/event_create', to:'events#create'
  
  get '/event_create', to:'events#new'

  resources :events

  resources :users
  
  get '/signup', to:'users#new'
  
  post '/signup', to:"users#create"

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
