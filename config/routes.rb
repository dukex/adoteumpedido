AdoteSeuPedido::Application.routes.draw do
  get "authorities" => "authority#index"

  devise_for :users

  resources :requests, only: [:index, :show, :new, :create] do
    resource :comments, only: [:create]
    resources :adopts, only: [:new, :show, :create]
  end

  match "/entenda" => "application#about", as: 'about'
  root to: "application#index"
end
