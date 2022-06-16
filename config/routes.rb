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
      resources :products, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
