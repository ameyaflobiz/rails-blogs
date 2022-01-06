Rails.application.routes.draw do
  get 'images/index'
  get 'images/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index" 
  
  resources :articles do
    resources :images
    resources :comments
  end
  resources :physicians do
    resources :images
  end
end
