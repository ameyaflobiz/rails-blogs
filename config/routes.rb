Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web=>"/sidekiq"
  get 'images/index'
  get 'images/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"

  resource :users, only:[:create]
  post "/login",:to =>"users#login"
  get "/auto_login",to:"users#auto_login"
  resources :articles do
    resources :images
    resources :comments
  end
  resources :physicians do
    resources :images
  end
end
