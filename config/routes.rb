Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, except: :destroy
  post 'products/:id/retire', to: 'products#retire', as: 'retire'

  resources :categories

  resources :orders

  resources :reviews

  resources :users
end
