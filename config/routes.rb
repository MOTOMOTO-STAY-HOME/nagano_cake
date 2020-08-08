Rails.application.routes.draw do

  get "product_genres/:id" => "product_genres#index"#ジャンルのサイドバーからジャンル検索する際にidが必要なので変更しました。
  get 'product_genres/show'

  get "/orders/confirm" => "orders#confirm"
  get "/orders/thanks" => "orders#thanks"
  #get"/customers"=> "customers#show,edit"がresouceとは別に存在していたので消しました。
  root 'home#top'
  get 'home/about'
  resource :customers, only: [:show, :edit, :update]
  devise_for :customers, controllers:{
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }
  patch "/customers/hide" => "customers#hide", as: 'customers/hide' #get=>patch
  get "/customers/last_confirm" => "customers#last_confirm"#conform=>confirm
  resources :cart_products, only: [:index, :create, :update, :show]
  delete "/cart_products/:id" => "cart_products#reset" #get=>delete
  resources :orders, only: [:new, :index, :show, :create]

  get "/orders/confirm" => "orders#confirm"
  get "/orders/thanks" => "orders#thanks"
  resources :ships, only: [:index, :create, :edit, :update, :destroy]
  resources :products, only: [:index, :show]
  devise_for :admins, controllers:{
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    registrations: "admins/registrations"
  }
  namespace :admins do
    get 'home/top'
    resources :products, only: [:new, :index, :show, :edit, :create, :update]
    patch "/products/:id" => "products#hide"#get=>patch
    resources :product_genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
  end
end
