Arthouse::Application.routes.draw do
  
  resources :galleries

  root :to => 'site#index'

  
end
