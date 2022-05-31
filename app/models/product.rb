# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  name        :string(255)
#  price       :decimal(10, 2)
#  stock       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  before_save :notify_product_saving
  before_update :out_of_stock, if: :stock_changed?
  after_save :notify_product_saved

  def stock_changed?
    stock_was != stock && stock < 5
  end

  private

  def out_of_stock
    Rails.logger.info { " - Producto #{name} con stock reducido, llamar al proveedor - " }
  end

  def notify_product_saving
    Rails.logger.info { " - Producto #{name} guardado - " }
  end

  def notify_product_saved
    Rails.logger.info { " - Producto #{name} persistido y almacenado en bodega - " }
  end
end
