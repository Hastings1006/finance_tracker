Rails.application.routes.draw do
  get 'transaction/new'
  get 'transaction/create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
# config/routes.rb
  resources :accounts, only: [:index, :show, :edit, :update, :new, :create, :destroy]
  resources :budgets, only: [:index, :show, :edit, :update, :new, :create] do
    resources :transactions, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  resources :transactions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :transaction_categories, only: [:index,:show, :new, :create, :destroy]
  end
  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :transaction_categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]

end
