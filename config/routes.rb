Rails.application.routes.draw do
  resources :goals, only: [:new, :create]
  resources :logs, only: [:index, :new, :create]
  root 'goals#index'
end
