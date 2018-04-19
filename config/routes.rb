Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products

  resources :categories

  resources :orders

  resources :reviews

  resources :users
end