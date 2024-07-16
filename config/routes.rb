Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
# config/routes.rb
  resources :accounts, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
    resources :songs, only: [:index, :show]
  end
  resources :budgets, only: [:show, :edit, :update, :new, :create]
  resources :transactions, only: [:index, :show, :new, :create]



end
