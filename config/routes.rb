Rails.application.routes.draw do
  resources :goals, only: [:index, :new, :create] do
    resources :logs, only: [:index, :create]
  end
  root 'goals#index'
end
