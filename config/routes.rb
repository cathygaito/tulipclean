Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  root 'static_pages#home'

  resources :users
  resources :products
  resources :orders

  get 'static_pages/about'
  
end
