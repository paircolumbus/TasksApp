Rails.application.routes.draw do
  resources :tasks, :except => [:new, :edit]
  root 'tasks#index'
end
