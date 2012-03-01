Deals::Application.routes.draw do
  root to: "Main#home"

  match '/admin/login', to: 'Admin::Sessions#new'

  resources :vendors do
    resources :offers
  end

  match '/admin' => 'Admin::Pages#index'

  namespace :admin do
    resources :offers, :vendors
    resources :sessions, only: [:new, :create, :destroy]
  end

  # match '/v/:username' => 'Vendors#show'
  # resources :vendors, path: 'v' do
end