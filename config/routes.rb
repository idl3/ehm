Deals::Application.routes.draw do
  root to: 'Cities#show'

  match '/welcome'        =>      'Welcome#home'
  match '/admin'          =>      'Admin::Pages#index'

  resources :cities,      only: :show
  resources :vendors,     only: :show
  resources :offers,      only: :show

  namespace :admin do
    match '/login',       to:     'Sessions#new'
    match '/logout',      to:     'Sessions#destroy'
    match '/settings',    to:     'Vendors#edit'

    resources :offers
    resources :sessions,  only: [:new, :create, :destroy]
    # resources :vendors,   only: [:edit, :show, :update]
  end
end