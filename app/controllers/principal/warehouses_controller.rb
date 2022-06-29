class Principal::WarehousesController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @title = 'Warehouses'
    @products = Product.limit(5)
  end

  def show; end

  private

  def set_product
    @product = Product.find_by uuid: params[:uuid]
    @title = @product.name
  end
end
