module Swaggers
  module OrderModel
    extend ActiveSupport::Concern

    included do
      swagger_schema :OrderInputForCreate do
        key :required, [:email, :products]
        property :email do
          key :type, :string
        end
        property :products do
          key :type, :array
          items do
            key :type, :object
            property :id do
              key :type, :string
              key :format, :uuid
            end
            property :quantity do
              key :type, :integer
            end
          end
        end
      end

      swagger_schema :OrderInput do
        property :email do
          key :type, :string
        end
        property :status do
          key :type, :string
        end
      end

      swagger_schema :Order do
        property :id do
          key :type, :string
          key :format, :uuid
        end
        property :email do
          key :type, :string
        end
        property :total_price do
          key :type, :number
          key :format, :decimal
          key :description, '2 decimal number'
        end
        property :order_items do
          key :type, :array
          items do
            key :type, :object
            key :'$ref', :OrderItem
          end
        end
      end

      swagger_schema :OrderWithAllInfo do
        property :id do
          key :type, :string
          key :format, :uuid
        end
        property :email do
          key :type, :string
        end
        property :total_price do
          key :type, :number
          key :format, :decimal
          key :description, '2 decimal number'
        end
        property :order_items do
          key :type, :array
          items do
            key :type, :object
            key :'$ref', :OrderItemWithProduct
          end
        end
      end
    end
  end
end
