FactoryBot.define do
  factory :order_item do
    order_id { nil }
    product_id { nil }
    quantity { 2 }
    product_price { 5.50 }
  end
end
