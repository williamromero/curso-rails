require 'rails_helper'
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
RSpec.describe Product, type: :model do
  describe 'Testing methods when product is saved or updated' do
    let!(:product) { described_class.create(name: 'Apple TV', description: 'Description', price: 10.0, stock: 10) }
    let!(:expected) { "- Producto #{product.name} con stock reducido, llamar al proveedor -" }

    it 'should have a valid factory' do
      expect(product).to be_valid
    end

    it 'should fire a log when product stock is updated with a number < 5' do
      allow(Rails.logger).to receive(:info).and_return(expected)
      product.stock = 1
      product.stock = 2

      product.save
      expect(Rails.logger).to receive(:info).with(expected) unless product.stock == product.stock_was
      expect(Rails.logger).to have_received(:info).at_least(3).times
    end
  end
end

#  https://relishapp.com/rspec/rspec-mocks/v/3-11/docs/basics/allowing-messages
#  https://www.youtube.com/watch?v=ciVXLf6YnUE
