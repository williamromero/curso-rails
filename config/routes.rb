Rails.application.routes.draw do

  root 'credit_cards#principal'

  resources :credit_cards, only: [:index] do
    collection do
      get :principal
      get :payment
    end
  end

  resources :products, param: :uuid
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
