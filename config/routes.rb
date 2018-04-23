Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'products#index'


  resources :products, except: :destroy do
    resources :reviews, only: [:create, :new]
  end

  post 'products/:id/retire', to: 'products#retire', as: 'retire'


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
