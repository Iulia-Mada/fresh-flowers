module Swaggers
  module OrderItemModel
    extend ActiveSupport::Concern

    included do
      swagger_schema :OrderItem do
        property :id do
          key :type, :string
          key :format, :uuid
        end
        property :order_id do
          key :type, :string
          key :format, :uuid
        end
        property :quantity do
          key :type, :integer
        end
        property :product_price do
          key :type, :number
          key :format, :decimal
          key :description, '2 decimal number'
        end
      end

      swagger_schema :OrderItemWithProduct do
        property :id do
          key :type, :string
          key :format, :uuid
        end
        property :order_id do
          key :type, :string
          key :format, :uuid
        end
        property :quantity do
          key :type, :integer
        end
        property :product_price do
          key :type, :number
          key :format, :decimal
          key :description, '2 decimal number'
        end
        property :product do
          key :type, :array
          items do
            key :type, :object
            key :'$ref', :Product
          end
        end
      end

      swagger_schema :OrderItemInput do
        property :quantity do
          key :type, :integer
        end
      end
    end
  end
end
