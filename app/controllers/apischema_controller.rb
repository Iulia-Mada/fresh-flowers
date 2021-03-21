class ApischemaController < ApplicationController
  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'FRESH FLOWERS API'
      key :description, ''
      contact do
        key :name, 'Fresh Flowers API'
      end
    end
    tag do
      key :name, 'Fresh Flowers'
      key :description, 'Use these endpoints to manage Fresh Flowers resources.'
    end
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  INTERNAL_CLASSES = [
      self,
      Api::V1::ProductsController,
      Product,
      Api::V1::OrdersController,
      Order,
      Api::V1::OrderItemsController,
      OrderItem
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(INTERNAL_CLASSES)
  end
end
