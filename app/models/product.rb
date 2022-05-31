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
  after_save  :notify_product_saved

  before_update :out_of_stock, if: :stock_changed?

  def stock_changed?
    self.stock_was != self.stock && self.stock < 5
  end

  def out_of_stock
    puts " - Producto #{self.name} con stock reducido, llamar al proveedor - "
  end

  def notify_product_saving
    puts " - Producto #{self.name} guardado - "
  end

  def notify_product_saved
    puts " - Producto #{self.name} persistido y almacenado en bodega - "
  end

end
