Deals::Application.routes.draw do
  root to: "Main#home"

  resources :vendors do
    resources :offers
  end

  match '/admin' => 'Admin::Pages#index'
end