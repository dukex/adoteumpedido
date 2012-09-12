AdoteSeuPedido::Application.routes.draw do
  devise_for :users

  resources :fois, only: [:index, :show, :new]
end
