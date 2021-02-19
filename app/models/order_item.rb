class OrderItem < ApplicationRecord
  include Swaggers::OrderItemModel

  belongs_to :order
  belongs_to :product

  validates_presence_of :order_id, :product_id, :product_price
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  def total_price
    self.quantity * self.product_price
  end
end
