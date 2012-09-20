AdoteSeuPedido::Application.routes.draw do

  devise_for :users

  resources :fois, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
  end

  root to: "fois#index"
end
