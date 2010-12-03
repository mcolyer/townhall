Townhall::Application.routes.draw do
  devise_for :users

  resources :meetings
  resources :tags

  root :to => "meetings#index"
end
