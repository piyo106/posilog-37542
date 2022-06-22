Rails.application.routes.draw do
  get 'logs/index'
  root 'goals#index'
end
