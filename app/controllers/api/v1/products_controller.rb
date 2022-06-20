class Api::V1::ProductsController < Api::V1::ApplicationController
  before_action :authenticate_user

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find_by uuid: params[:uuid]
    render json: @product
  end
end
