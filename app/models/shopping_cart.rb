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

  # def check_previous_active?
  #   return false if self.nil?
  #   ShoppingCart.where(user_id: self.user_id, active: true) != nil ? true : false
  # end

  # def check_active
  #   return self.nil? ? false : true
  #   Rails.logger.warn { "- #{check_previous_active? ? "Si hay un carrito activo" : "No hay un carrito activo"} -" } 
  # end

end
