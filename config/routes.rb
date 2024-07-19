Rails.application.routes.draw do
  get 'pots/index'
  get 'pots/show'
  get 'pots/new'
  get 'pots/create'
  get 'pots/edit'
  get 'pots/update'
  get 'pots/destroy'
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users do
    resources :pots
  end
  resources :accounts
  resources :budgets

  resources :transactions
  resources :categories

  resources :pots
end
