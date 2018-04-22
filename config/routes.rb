Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'products#index'


  resources :products, except: :destroy do
    resources :reviews, only: [:create]
  end

  post 'products/:id/retire', to: 'products#retire', as: 'retire'


  resources :categories

  resources :orders

  resources :reviews

  resources :users do
    resources :products, only: [:index, :new, :create]
  end
end
