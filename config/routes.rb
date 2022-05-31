# == Route Map
#

Rails.application.routes.draw do

  scope "(:locale)", locale: /en|es/ do

    get 'credit_cards/principal'
    get 'credit_cards/payment'
    resources :products

  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
