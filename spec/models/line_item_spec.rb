# == Schema Information
#
# Table name: line_items
#
#  id               :bigint           not null, primary key
#  quantity         :integer          default(1)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_id       :bigint           not null
#  shopping_cart_id :bigint           not null
#
# Indexes
#
#  index_line_items_on_product_id        (product_id)
#  index_line_items_on_shopping_cart_id  (shopping_cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (shopping_cart_id => shopping_carts.id)
#
require 'rails_helper'

RSpec.describe LineItem, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
