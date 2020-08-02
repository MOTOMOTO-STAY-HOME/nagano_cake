Rails.application.routes.draw do

  root 'home#top'
  get 'home/about'
  devise_for :customers, controllers:{
    registrations: 'customers/resistrations',
    sessions: 'customers/sessions'
  }

  resource :customers, only: [:show, :edit, :update]
  get "/customers" => "customers#hide"
  get "/customers/last_conform" => "customers#last_conform"
  resources :cart_products, only: [:index, :create, :update, :show]
  get "/cart_products/:id" => "cart_products#reset"
  resources :orders, only: [:new, :index, :show, :create]
  get "/orders/confirm" => "orders#confirm"
  get "/orders/thanks" => "orders#thanks"
  resource :ships, only: [:index, :show, :create, :update, :destroy]
  resources :products, only: [:index, :show]


  #devise_for :admins
  namespace :admins do
    get 'home/top'
    resources :products, only: [:new, :index, :show, :edit, :create, :update]
    get "/products/:id" => "products#hide"
    resources :product_generes, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update] do
      resources :orders, only: [:index, :show, :update] do
        resources :order_products, only: [:update]
      end
    end
  end

end
