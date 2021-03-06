Rails.application.routes.draw do

   get '/login', to:'sessions#new'

  post '/login', to:'sessions#create'

  delete '/logout', to:'sessions#destroy'

  resources :joins, only: [:create,:destroy, :edit, :update]
  
  resources :events, only: [:create, :destroy, :show, :edit, :update]

  resources :users
  
  get '/signup', to:'users#new'
  
  post '/signup', to:"users#create"

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
