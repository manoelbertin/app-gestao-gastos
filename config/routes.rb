Rails.application.routes.draw do
  devise_for :users
  resources :movimentacoes, only: [:index, :new, :create, :destroy]

  root "movimentacoes#index"
end
