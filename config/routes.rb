Rails.application.routes.draw do
  get 'preusers/new'

  get 'preusers/create'
  post 'preusers/create'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get '/refer-a-friend' => 'preusers#refer'


if Rails.application.config.ended
  root 'static_pages#home'
else
  get 'alonzohome' => 'static_pages#prehome'
  get 'alonzorefer' => 'preusers#refer'
  get 'alpha' => 'preusers#refer'
  get 'launcher' => 'preusers#refer'
  get 'launchr' => 'preusers#refer'
  get 'pre-launch' => 'preusers#refer'
  get 'pre-launcher' => 'preusers#refer'
  get 'pre-launchr' => 'preusers#refer'
  get 'prelaunch' => 'preusers#refer'
  get 'prelauncher' => 'preusers#refer'
  get 'prelaunchr' => 'preusers#refer'
  root 'static_pages#prehome'
end

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

  get 'static_pages/home'
  
end
