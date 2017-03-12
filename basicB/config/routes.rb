Rails.application.routes.draw do
  
  #devise_for :users, controllers: { sessions: {url: 'users/pink_elephants_controller.rb'} }
  devise_for :users, controllers: { sessions: 'users/registrations' }
  # get 'profile', to: :show, controller: 'users'
  # get 'profile', to: :show, controller: 'users'
  # get 'index', to: :show, controller: 'dashes'
  
  # get 'profile', to: 'users#show'
  get 'dash', to: 'dashes#show'
  
  resources :dashes
  resources :campaigns
  resources :players
  resources :countries
  
  root "campaigns#index" 
  
  # yank later
  resources :neighborhoods
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # resources :userplay
  # resources :userplays
end
