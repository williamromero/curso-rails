# == Schema Information
#
# Table name: shopping_carts
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE), not null
#  total      :decimal(10, 2)   default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
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
  
  belongs_to :user
  has_many :line_items

  before_create :allow_only_one_active_cart
  after_create :notify_created_cart

  def allow_only_one_active_cart
    return raise Cart::Error.new('El usuario posee un carrito de compras activo') if check_previous_active?
    self.active = true
  end

  def notify_created_cart
    Rails.logger.info 'Se creo un nuevo carrito de compras'
  end

  def check_previous_active?
    return ShoppingCart.where(user: self.user, active: true).exists?
  end

end
