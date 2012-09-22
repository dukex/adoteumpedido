AdoteSeuPedido::Application.routes.draw do

  devise_for :users

  resources :requests, only: [:index, :show, :new, :create] do
    resource :comments, only: [:create]
  end

  root to: "requests#index"
end
