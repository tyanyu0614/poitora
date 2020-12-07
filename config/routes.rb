Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: :show
  resources :relationships, only: [:create, :destroy]

  resources :plans do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  collection do
      get 'search'
    end
  end
end