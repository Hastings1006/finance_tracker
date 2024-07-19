Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :accounts
  resources :budgets

  resources :transactions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :transaction_categories, only: [:index,:show, :new, :create, :destroy]
  end
  resources :categories
  resources :transaction_categories
end
