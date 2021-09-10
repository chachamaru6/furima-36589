Rails.application.routes.draw do
  get 'messages/new'
  resources :messages, only: [:create]
  
  devise_for :users
  root to: "items#index"
  resources :items do
   resources :orders, only: [:index, :create]
  end




end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

