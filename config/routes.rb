Deals::Application.routes.draw do
  root to: "Offers#index"

  match '/admin' => 'Admin::Pages#index'
  match '/v/:vendor' => 'Vendors#show'
  match '/expiring' => 'Offers#expiring'

  resources :vendors, path: 'v', only: [:index, :show]
  resources :offers, only: [:index, :show]
  resources :categories, path: 'c', only: [:show]

  namespace :admin do
    match '/login', to:  'Sessions#new'
    match '/logout', to: 'Sessions#destroy'
    resources :offers
    resources :vendors,  only: [:edit, :show, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end
end