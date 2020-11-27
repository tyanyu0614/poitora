Rails.application.routes.draw do
  devise_for :users
  get 'plans/index'
  root to: "plans#index"
end
