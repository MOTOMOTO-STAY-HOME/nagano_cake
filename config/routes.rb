Rails.application.routes.draw do

  namespace :admins do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admins do
    get 'products_genere/index'
    get 'products_genere/edit'
  end
  namespace :admins do
    get 'products/new'
    get 'products/index'
    get 'products/show'
    get 'products/edit'
  end
  #get"/customers"=> "customers#show,edit"がresouceとは別に存在していたので消しました。
  root 'home#top'
  get 'home/about'
  devise_for :customers
  resource :customers, only: [:show, :edit, :update]
  patch "/customers" => "customers#hide"#get=>patch
  get "/customers/last_confirm" => "customers#last_confirm"#conform=>confirm
  resources :cart_products, only: [:index, :create, :update, :show]
  delete "/cart_products/:id" => "cart_products#reset" #get=>delete
  resources :orders, only: [:new, :index, :show, :create]
  get "/orders/confirm" => "orders#confirm"
  get "/orders/thanks" => "orders#thanks"
  resource :ships, only: [:index, :show, :create, :update, :destroy]
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
    resources :product_generes, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update] do
      resources :orders, only: [:index, :show, :update] do
        resources :order_products, only: [:update]
      end
    end
  end

end
