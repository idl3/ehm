Deals::Application.routes.draw do
  root to: "Cities#show"

  match '/welcome'        =>      'Welcome#home'
  match '/admin'          =>      'Admin::Pages#index'

  resources :cities,      path: '/',    only: :show
  resources :vendors,     path: 'v',    only: :show
  resources :offers,                    only: :show

  namespace :admin do
    match '/login',       to:     'Sessions#new'
    match '/logout',      to:     'Sessions#destroy'
    match '/settings',    to:     'Vendors#edit'

    resources :offers
    resources :vendors,   only: [:edit, :show, :update]
    resources :sessions,  only: [:new, :create, :destroy]
  end

end