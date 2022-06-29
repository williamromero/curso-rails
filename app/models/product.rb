# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  code        :string(255)
#  description :string(255)
#  name        :string(255)
#  price       :decimal(10, 2)
#  stock       :integer
#  uuid        :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'faker'

class Product < ApplicationRecord
  has_many :line_items

  # Callbacks
  before_save   :notify_product_saving
  before_create :generate_uuid, :generate_code
  before_update :out_of_stock, if: :stock_is_changed?
  before_update :notify_different_price, if: :price_is_changed?
  after_save    :notify_product_saved

  # Validations
  validates :name, presence: { message: 'El campo nombre no ha sido correctamente introducido' }
  validates :description, presence: { message: 'El campo descripción no ha sido correctamente introducido' }
  validates :price,
            numericality: { greater_than_or_equal_to: 1, message: 'El precio %{value} debe ser mayor o igual a 0' }
  validates_with ProductValidator
  validate  :description_validate
  # validates :code, :confirmation => true, unless: Proc.new { |resource| resource.code == "" }
  validates :code, uniqueness: { message: 'El código ya existe' }
  # Scopes
  scope :availables, -> { where('stock > 0') }
  scope :cheaper_products, ->(precio) { where('price < ?', precio) }
  scope :ordered_by_price, -> { order(price: :desc) }

  # Includes

  # Class Methods
  def self.top_five_cheap_products(limit: nil, precio: nil)
    cheaper_products(precio).limit(limit).ordered_by_price.select(:name, :price)
  end

  def stock_is_changed?
    stock_was != stock && stock < 5
  end

  def price_is_changed?
    price_was != price
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
    if !description.nil? && description.length <= 10
      errors.add(:description, 'La descripción debe tener más de 10 caracteres')
    end
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def generate_code
    self.code = "P#{[*0..9].sample(6).join}-#{Date.today.strftime('%Y%m%d')}"
  end
end
