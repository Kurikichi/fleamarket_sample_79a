Rails.application.routes.draw do

  root 'products#index'
  resources :products, except: :index
  resources :categories
  resources :images
  resources :users,  only: [:index, :edit]
 
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'delivery_address', to: 'users/registrations#new_delivery_address'
    post 'delivery_address', to: 'users/registrations#create_delivery_address'
  end

end
