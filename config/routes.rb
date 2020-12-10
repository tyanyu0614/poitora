Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: :show
  # resources :relationships, only: [:create, :destroy]
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  resources :plans do
    resources :comments, only: :create
  collection do
      get 'search'
    end
  end
end