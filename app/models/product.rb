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
  # Callbacks
  before_save   :notify_product_saving
  before_update :out_of_stock, if: :stock_is_changed?
  after_save    :notify_product_saved

  # Validations
  validates :name, presence: { message: 'El campo nombre no ha sido correctamente introducido' }
  validates :description, presence: { message: 'El campo descripción no ha sido correctamente introducido' }
  validates :price, numericality: { greater_than_or_equal_to: 0, message: 'El precio %{value} debe ser mayor o igual a 0' }
  validates_with ProductValidator
  validate  :description_validate

  # Includes

  def stock_is_changed?
    stock_was != stock && stock < 5
  end

  def out_of_stock
    Rails.logger.info { "- Producto #{name} con stock reducido, llamar al proveedor -" }
  end

  def notify_product_saving
    Rails.logger.info { "- Producto #{name} guardado -" }
  end

  def notify_product_saved
    Rails.logger.info { "- Producto #{name} persistido y almacenado en bodega -" }
  end

  def description_validate
    unless description.nil?
      errors.add(:description, 'La descripción debe tener más de 10 caracteres') unless description.length > 10
    end
  end
  
end
