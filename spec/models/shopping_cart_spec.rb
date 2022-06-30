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
require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  before(:each) do
    @cart = create_shopping_cart
  end

  describe '#add_product to shopping cart' do
    context 'when user is not logged' do
      it 'should create a new shopping cart without user references' do
        @cart.save
        expect(@cart.user_id).to be_nil
      end

      it 'should create a new shopping cart with a uuid' do
        @cart.save
        expect(@cart.uuid.length).to eq(36)
      end

      it 'should test first if user is nil and have an unactive shopping cart' do
        expect(@cart.user_id.nil?).to be_truthy
      end
    end

    context 'when user is logged' do
      let!(:user)     { create(:user) }
      let!(:cart)     { create_list(:shopping_cart, 5, user: user, active: false) }
      let!(:cart_two) { create(:shopping_cart, user: user, active: true) }
      let(:last_cart) { build(:shopping_cart, user_id: 1, active: true) }

      it 'should test if user is not nil and havent previous shopping cart' do
        shopping_carts = described_class.where(user_id: user.id)
        described_class.notify_last_cart_closed(shopping_carts) if user.shopping_carts.check_previous_active?
        expect(described_class.retrieve_actived_carts(shopping_carts)).to be(false)
        
        user.shopping_carts.cart_creation_setup
        shopping_carts = described_class.where(user_id: user.id)
        expect(described_class.retrieve_actived_carts(shopping_carts)).to eq(true)
      end
    end
  end

  def create_shopping_cart(options = {})
    params = {
      total: 0.0,
      active: true,
      user_id: nil,
      uuid: '30679e2c-571d-406e-8c03-054b71e303eb'
    }
    params.merge(options)
    @cart = ShoppingCart.new(params)
  end
end
