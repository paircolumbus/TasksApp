Rails.application.routes.draw do
  get 'welcome/index'

  resources :tasks

  root 'tasks#welcome'
end
