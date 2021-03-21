class OrderSerializer <  ActiveModel::Serializer
  has_many :order_items, serializer: OrderItemSerializer

  attributes :id, :status, :email, :total_price

  def total_price
    object.total_price
  end
end
