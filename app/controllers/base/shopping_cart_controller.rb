module Base
  class ShoppingCartController < ApplicationController
    # before_action :authenticate_user
    def index
      shopping_carts = ShoppingCart.second.line_items.includes(:product, :shopping_cart)

      render json: shopping_carts.to_json(
        include: {
          product: { only: %i[name price] },
          shopping_cart: {
            only: [:total],
            include: {
              user: { only: [:username] }
            }
          }
        },
        except: %i[created_at updated_at]
      )
    end

    def list_items
      # shopping_carts = ShoppingCart.select("line_items.*, shopping_carts.*")
      #                              .joins("LEFT JOIN line_items ON line_items.shopping_cart_id = #{params[:id]}")
      #                              .group_by(&:shopping_cart_id)
      shopping_carts = ShoppingCart.find(params[:id]).line_items.includes(:product, :shopping_cart)
      render json: shopping_carts.to_json(
        include: { product: { only: %i[name price] },
                   shopping_cart: { only: [:total] } }, except: %i[created_at updated_at]
      )
    end
  end
end
