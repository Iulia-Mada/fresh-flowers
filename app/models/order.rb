class Order < ApplicationRecord
  include Swaggers::OrderModel

  paginates_per 30

  has_many :order_items, dependent: :destroy

  enum status: [:processing, :shipped, :delivered, :canceled, :payed]

  validates :email, email: true

  def total_price
    order_items.sum { |order_item| order_item.total_price }
  end
end
