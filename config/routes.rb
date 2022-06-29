Rails.application.routes.draw do  
  root 'products#index'

  resources :products, param: :uuid

  namespace :base do

    resources :shopping_cart, only: [:index] do
      member do
        get :list_items
      end
    end

    resources :credit_cards, only: [:index] do
      collection do
        get :principal
        get :payment
      end
    end

  end

  namespace :api do
    namespace :v1 do
      
      resources :products, only: [:index, :show], param: :uuid

      resources :shopping_carts, only: [:create] do
        collection do          
          post :build_object
          post :add_product
          post :remove_products
          post :decrease_products
          
          get  :sum_products
        end
      end

      resources :authentications, path: '/', only: [] do
        collection do
          post :login
          post :forgot
          post :register
          post :reset_password
          post :change_password
          post :logout
        end

      end   
    end
  end

  scope :principal, as: "principal", module: "principal" do
    resources :warehouses, except: [:show] do
      collection do
        get 'products/:uuid', to: 'warehouses#show'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
