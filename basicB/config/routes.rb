Rails.application.routes.draw do
  
  devise_for :users
  get 'dash', to: :show, controller: 'dash'
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
