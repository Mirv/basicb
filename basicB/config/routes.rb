Rails.application.routes.draw do
  resources :dashes
  resources :userplay
  resources :userplays
  devise_for :users
  resources :campaigns
  resources :neighborhoods
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :countries
  root "campaigns#index"  
end
