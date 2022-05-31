Rails.application.routes.draw do
  get 'credit_cards/principal'
  get 'credit_cards/payment'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
