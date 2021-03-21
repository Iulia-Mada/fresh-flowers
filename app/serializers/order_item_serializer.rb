class OrderItemSerializer <  ActiveModel::Serializer
  belongs_to :product, serializer: ProductSerializer

  attributes :id, :quantity, :product_price
end
