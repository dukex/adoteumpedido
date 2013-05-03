AdoteSeuPedido::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "authorities" => "authority#index"

  resources :requests, only: [:index, :show, :new, :create] do
    resource :comments, only: [:create]
    resources :adopts, only: [:new, :show, :create]
  end

  match "/entenda" => "application#about", as: 'about'
  root to: "application#index"
end
