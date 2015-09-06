Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  root 'static_pages#home'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :products
  resources :orders
  resources :charges

  get 'static_pages/about'
  get 'cart' => 'orders#cart'
  post '/orders/:id' => 'orders#payment'
  
end
