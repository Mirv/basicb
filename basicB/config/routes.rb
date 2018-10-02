Rails.application.routes.draw do
  resources :campaign_registrations 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :countries
  devise_for :users #, controllers: { sessions: 'users/registrations' }
  get 'dashboard', to: 'dashes#dashboard'
  resources :dashes 
  resources :campaigns do
   member do
    get 'join'
    get 'leave'
   end
  end
  resources :players
  
  #get 'exit', to: 'sessions#destroy', as: :logout
 
   root "campaigns#index" 
   
  #api
  namespace :api do
    namespace :v1 do
      resources :campaigns
      resources :countries
      resources :players
      resources :dashes
      resources :users
    end
  end
   
   # yank later
   resources :neighborhoods
end
