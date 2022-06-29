class Api::V1::ShoppingCartsController < Api::V1::ApplicationController
  # skip_before_action :authenticate_user
  rescue_from Cart::Error, with: -> { head :unprocessable_entity }
  before_action :set_shopping_cart, only: [:add_product, :sum_products, :remove_products, :decrease_products]

  def build_object
    shopping_cart = ShoppingCart.initialize_attributes shopping_cart_params
    raise Cart::Error, 'El carrito de compras no ha sido creado' if shopping_cart == false

    render json: shopping_cart
  end

  def add_product
    raise Cart::Error, 'El carrito de compras no ha sido creado' if @shopping_cart.nil?

    product = Product.find(params[:product_id])
    @shopping_cart.add_product product if product.present?
    render json: @shopping_cart.line_items
  end

  def sum_products
    raise Cart::Error, 'El carrito de compras no ha sido creado' if @shopping_cart.nil?
    
    line_items = @shopping_cart.line_items.includes(:product)
    render json: {
      "total": line_items.joins(:product).sum(&:total_price),
      "items": line_items.as_json(
        only:    [:quantity, :product_id], 
        include: { product: { only: [:name, :price] } },
        methods: [:total_price],
      ),
    }
  end

  def remove_products
    raise Cart::Error, 'El carrito de compras no ha sido creado' if @shopping_cart.nil?

    product = Product.find(params[:product_id])
    @shopping_cart.remove_product product if product.present?
    render json: @shopping_cart.line_items.includes(:product).as_json(
      only:    [:quantity, :product_id], 
      include: { product: { only: [:name, :price] } },
      methods: [:total_price],
    )
  end

  def decrease_products
    raise Cart::Error, 'El carrito de compras no ha sido creado' if @shopping_cart.nil?

    product = Product.find(params[:product_id])
    @shopping_cart.decrease_quantity product if product.present?
    render json: @shopping_cart.line_items.includes(:product).as_json(
      only:    [:quantity, :product_id], 
      include: { product: { only: [:name, :price] } },
      methods: [:total_price],
    )
  end

  private

  def set_shopping_cart
    @shopping_cart = ShoppingCart.find_by(uuid: params[:uuid])
  end

  def shopping_cart_params
    params.require(:shopping_cart).permit(:active, :total, :uuid, :user_id)
  end
end
