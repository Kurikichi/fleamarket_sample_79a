Rails.application.routes.draw do

  root 'products#index'
  resources :products, except: :index
  resources :categories
  resources :images
 
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
