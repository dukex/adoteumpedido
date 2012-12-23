AdoteSeuPedido::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :requests, only: [:index, :show, :new, :create] do
    resource :comments, only: [:create]
    resources :adopts, only: [:new, :show, :create]
  end

  match "/entenda" => "application#about", as: 'about'
  root to: "application#index"
end
