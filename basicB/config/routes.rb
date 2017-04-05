Rails.application.routes.draw do
  
  devise_for :users #, controllers: { sessions: 'users/registrations' }
  
  # map.login '/login', :controller => 'sessions', :action => 'new'  ## 3rd try
  # get '/dash', :controller => 'dashes', :action => 'show'  ## 2nd try
  # get 'dash', to: 'dashes#show', :via => [:post], as: :dash  ## Original named route

  
  resources :dashes 
  resources :campaigns do
    member do
      get 'join'
      get 'leave'
    end
  end
  resources :players
  resources :countries

 #get 'exit', to: 'sessions#destroy', as: :logout

  root "campaigns#index" 
  
  # yank later
  resources :neighborhoods
end
