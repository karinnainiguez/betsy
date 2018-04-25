Rails.application.routes.draw do
  get 'main/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'main#index'

  resources :products, except: :destroy do
    resources :reviews, only: [:create, :new]
    post '/retire', to: 'products#retire', as: 'retire'
  end

  resources :categories

  resources :orders

  resources :reviews

  resources :users, except: [:new, :create] do
    resources :products, only: [:index, :new, :create]
  end

   get '/login', to: 'sessions#new', as: 'login'
   post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/:provider/callback', to: 'sessions#create'
end
