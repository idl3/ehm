Deals::Application.routes.draw do
  root to: "Main#home"

  match '/vendors/:username' => "Vendors#show" # IS THIS THE WAY TO DO IT?
  match '/admin' => 'Admin::Pages#index'

  resources :vendors,  only: [:index, :show] do
    resources :offers, only: [:index, :show]
  end

  namespace :admin do
    match '/login', to:  'Sessions#new'
    match '/logout', to: 'Sessions#destroy'

    resources :offers
    resources :vendors,  only: [:edit, :show, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end
end