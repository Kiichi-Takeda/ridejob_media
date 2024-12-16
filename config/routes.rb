Rails.application.routes.draw do
  get "home/index"
  root 'home#index'
  resources :jobs, only: [:index, :show]
end
