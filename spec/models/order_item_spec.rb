require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:product) { create(:product)}
  let(:order) { create(:order) }
  let!(:order_item){ create(:order_item, order: order, product: product, quantity: 2, product_price: 4) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:product_price) }
    it { is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than(0) }
  end

  describe '#total_price' do
    it 'calculates price per order item' do
      expect(order_item.total_price).to eql 8
    end
  end
end
