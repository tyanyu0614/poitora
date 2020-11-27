Rails.application.routes.draw do
  get 'plans/index'
  root to: "plans#index"
end
