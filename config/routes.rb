Rails.application.routes.draw do

  get 'ships/index'
  get 'ships/edit'
  #get"/customers"=> "customers#show,edit"がresouceとは別に存在していたので消しました。
  root 'home#top'
  get 'home/about'
  resource :customers, only: [:show, :edit, :update]
  devise_for :customers
  patch "/customers" => "customers#hide"#get=>patch
  get "/customers/last_confirm" => "customers#last_confirm"#conform=>confirm
  resources :cart_products, only: [:index, :create, :update, :show]
  delete "/cart_products/:id" => "cart_products#reset" #get=>delete
  resources :orders, only: [:new, :index, :show, :create]
  get "/orders/confirm" => "orders#confirm"
  get "/orders/thanks" => "orders#thanks"
  resources :ships, only: [:index, :create, :edit, :update, :destroy]
  resources :products, only: [:index, :show]


  devise_for :admins
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

