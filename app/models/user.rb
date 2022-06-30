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
  # has_one  :shopping_cart, -> { where(active: true).order(id: :desc) }

  after_create :generate_password_token

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  validates_with PasswordValidator

  def generate_password_token
    self.token = SecureRandom.uuid
    save!
  end

  def shopping_carts
    ShoppingCart.where(user: self, active: true)
  end
end
