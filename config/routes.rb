Rails.application.routes.draw do
  root 'tasks#index'
  delete '/' => 'tasks#destroy'
  post '/' => 'tasks#update'
  resources :tasks, only: [:index, :create, :update, :destroy]
end
