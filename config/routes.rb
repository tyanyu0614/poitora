Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :plans, only: [:index,:new,:create,:show,:destroy] do
  collection do
      get 'search'
    end
  end
end