Deals::Application.routes.draw do
  root to: "Cities#show"

  match '/welcome' => 'Welcome#home'
  match '/admin' => 'Admin::Pages#index'
  match '/:city' => 'Cities#show'
  match '/v/:vendor' => 'Vendors#show'

  resources :vendors, path: 'v', only: [:index, :show]
  resources :offers, only: [:index, :show]
  resources :cities, path: '/', only: [:show]

  namespace :admin do
    match '/login', to:  'Sessions#new'
    match '/logout', to: 'Sessions#destroy'
    resources :offers
    resources :vendors,  only: [:edit, :show, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end

end