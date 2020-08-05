Rails.application.routes.draw do

  root 'products#index'
  resources :products, except: :index
  resources :categories
  resources :images
 
 
  resources :credit_cards, only: [:new, :create, :show, :destroy]

  resources :users, only: [:index, :edit]
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'delivery_address', to: 'users/registrations#new_delivery_address'
    post 'delivery_address', to: 'users/registrations#create_delivery_address'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
