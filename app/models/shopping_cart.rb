# == Schema Information
#
# Table name: shopping_carts
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE), not null
#  total      :decimal(10, 2)   default(0.0)
#  uuid       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_shopping_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class ShoppingCart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :line_items

  after_create :notify_created_cart

  scope :active, -> { where active: true }
  scope :by_identity_token, ->(uuid) { where(uuid: uuid) }
  scope :with_account, -> { where.not(user: nil) }

  extend Generators::CartsInitializer

  def self.initialize_attributes(params)
    return cart_creation_setup if params[:user_id].nil?

    authorized_user = User.find params[:user_id]
    shopping_carts  = ShoppingCart.where user_id: authorized_user.id

    notify_last_cart_closed(shopping_carts) if shopping_carts.check_previous_active?
    authorized_user.shopping_carts.cart_creation_setup
  end

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.update_attribute(:quantity,
                                    current_item.quantity + 1)
    else
      line_items.create!(product: product, quantity: 1)
    end
  end

  def remove_product(product)
    current_item = line_items.find_by(product_id: product.id)
    current_item.destroy if current_item
  end

  def decrease_quantity(product)
    current_item = line_items.find_by(product_id: product.id)
    current_item.update_attribute(:quantity,
                                  current_item.quantity - 1)
    current_item.destroy if current_item.quantity.zero?
  end

  def total_price
    line_items.includes(:product).sum(&:total_price)
  end

  def self.check_previous_active?
    active.count.positive?
  end

  def self.notify_last_cart_closed(shopping_carts)
    shopping_carts.last.update active: false
    Rails.logger.warn "Se cerró el último carrito de compras abierto :: #{shopping_carts.last.uuid}"
  end

  def notify_created_cart
    Rails.logger.info 'Se creo un nuevo carrito de compras'
  end
end
