Rails.application.routes.draw do
 

   root "products#index"
  resources :users, except: :index do
    resources :orders, only: [:show, :index]
  end
  resources :products do
    resources :orders, only: [:new, :create]
	end
  # resource and session are singular because you only have one session at a time 
  resource :session, only: [:new, :create, :destroy]

end
