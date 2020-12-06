Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: :show
  resources :plans do
    resources :comments, only: :create
  collection do
      get 'search'
    end
  end
end