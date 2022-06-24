Rails.application.routes.draw do
  resources :goals, only: [:new, :create] do
    resources :logs, only: [:index, :new, :create]
  end
  root 'goals#index'
end
