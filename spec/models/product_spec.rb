require "rails_helper"
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
RSpec.describe Product, type: :model do
  describe 'Testing methods when product is saved or updated' do
    let!(:product) { described_class.create(name: 'Apple TV', description: 'Description', price: 10.0, stock: 10) }
    let!(:expected) { "- Producto #{product.name} con stock reducido, llamar al proveedor -" }

    it 'should have a valid factory' do
      expect(product).to be_valid
    end

    it 'should fire a log when product stock is updated' do
      # product.stock = 2
      product.stock = 3
      p product.changes
      product.save

      expect(product.out_of_stock).to eq(expected)

      # expect(product.save).to receive(:out_of_stock).with(expected)

      # expect(product.out_of_stock if product.changed?).to eq(expected)
      # allow(Rails.logger).to receive(:info).with(expected)
      # expect(Rails.logger).to receive(:info).with(expected)
    end
    
  end
end

# https://relishapp.com/rspec/rspec-mocks/v/3-11/docs/basics/allowing-messages
# https://www.youtube.com/watch?v=ciVXLf6YnUE
