Rails.application.routes.draw do
   root "products#index"
  resources :products
  resources :users
  # resource and session are singular because you only have one session at a time 
  resource :session, only: [:new, :create, :destroy]
end
