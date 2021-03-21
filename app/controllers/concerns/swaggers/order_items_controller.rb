module Swaggers
  module OrderItemsController
    extend ActiveSupport::Concern

    included do
      swagger_path '/api/v1/order_items/{id}' do
        operation :put do
          key :tags, [:order_item]
          key :summary, 'Update order_item'
          key :description, 'Update an order item entity.'
          parameter Helper.id_parameter('order item Id')
          parameter do
            key :name, :body
            key :in, :body
            key :description, 'order item to Update'
            schema do
              property :product do
                key :'$ref', :OrderItemInput
              end
            end
          end

          response 200 do
            key :description, :OK
            schema do
              key :'$ref', :OrderItem
            end
          end

          response 404 do
            key :description, 'Not Found'
            schema do
              key :example, Helper.error_404_msg(:OrderItem)
            end
          end

          response 422 do
            key :description, 'Unprocessable Entity'
            schema do
              key :example, 'validation errors'
            end
          end
        end
      end

      swagger_path '/api/v1/order_items/{id}' do
        operation :delete do
          key :tags, [:order_item]
          key :summary, 'Delete order_item'
          key :description, 'Delete an order item entity.'
          parameter Helper.id_parameter('order item Id')

          response 204 do
            key :description, 'No Content'
          end

          response 404 do
            key :description, 'Not Found'
            schema do
              key :example, Helper.error_404_msg(:OrderItem)
            end
          end
        end
      end
    end
  end
end
