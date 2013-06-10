Arthouse::Application.routes.draw do

  resources :galleries do
    member do
      post '/like' => 'galleries#like'
    end
  end
  get     'artists/index' => 'artists#index', :as => :artists
  get     '/login' => 'sessions#new', :as => :login_form
  post    '/login' => 'sessions#create', :as => :login
  get     '/logout' => 'sessions#destroy', :as => :logout
  get     '/signup' => 'user#new', :as => :signup
  post    '/signup' => 'user#create', :as => :new_user

  # post "signup" => 'users#create', :as => :signup

  root :to => 'site#index'

  
end
