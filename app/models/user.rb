# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)
#  password_digest :text(65535)
#  token           :text(65535)
#  username        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password
  has_many :shopping_carts
  has_one  :shopping_cart, -> { where(active: true).order(id: :desc) }


  
  # private
  # def shopping_carts
  #   return 'NO TENEMOS EL RREGISTRO' if self.nil?
  #   begin
  #     ShoppingCart.where(user_id: self.id, active: true).last
  #   rescue => exception
  #     raise 'No se pudo encontrar el carrito de compras'
  #   end
  # end

end
