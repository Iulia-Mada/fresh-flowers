module Swaggers
  module OrdersController
    extend ActiveSupport::Concern

    included do
      swagger_path '/api/v1/orders' do
        operation :get do
          key :tags, [:order]
          key :summary, 'List all Orders'
          key :description, 'Returns a list of orders.'
          parameter Helper.page_parameter

          response 200 do
            key :description, :OK
            schema do
              property :orders do
                key :type, :array
                items do
                  key :type, :object
                  key :'$ref', :Order
                end
              end
              property :meta do
                key :type, :object
                property :total_records do
                  key :type, :integer
                  key :description, 'Total count of orders (not paginated)'
                end
                property :total_pages do
                  key :type, :integer
                  key :description, 'Total count of pages'
                end
              end
            end
          end
        end
      end

      swagger_path '/api/v1/orders/{id}' do
        operation :get do
          key :tags, [:order]
          key :summary, 'Find Order by ID'
          key :description, 'Return a single order entity.'
          parameter Helper.id_parameter('Order Id')

          response 200 do
            key :description, :OK
            schema do
              key :'$ref', :OrderWithAllInfo
            end
          end

          response 404 do
            key :description, 'Not Found'
            schema do
              key :example, Helper.error_404_msg(:Order)
            end
          end
        end
      end

      swagger_path '/api/v1/orders' do
        operation :post do
          key :tags, [:order]
          key :summary, 'Create Order'
          key :description, 'Create an order entity.'
          parameter do
            key :name, :body
            key :in, :body
            key :description, 'Order to Create'
            schema do
              property :order do
                key :'$ref', :OrderInputForCreate
              end
            end
          end

          response 201 do
            key :description, :Created
            schema do
              key :'$ref', :Order
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

      swagger_path '/api/v1/orders/{id}' do
        operation :put do
          key :tags, [:order]
          key :summary, 'Update order'
          key :description, 'Update an order entity.'
          parameter Helper.id_parameter('order Id')
          parameter do
            key :name, :body
            key :in, :body
            key :description, 'order to Update'
            schema do
              property :product do
                key :'$ref', :OrderInput
              end
            end
          end

          response 200 do
            key :description, :OK
            schema do
              key :'$ref', :Order
            end
          end

          response 404 do
            key :description, 'Not Found'
            schema do
              key :example, Helper.error_404_msg(:Order)
            end
          end

          response 422 do
            key :description, 'Unprocessable Entity'
            schema do
              key :example, 'name has already been taken - validation errors'
            end
          end
        end
      end

      swagger_path '/api/v1/orders/{id}' do
        operation :delete do
          key :tags, [:order]
          key :summary, 'Delete an order'
          key :description, 'Delete an order entity.'
          parameter Helper.id_parameter('order Id')

          response 204 do
            key :description, 'No Content'
          end

          response 404 do
            key :description, 'Not Found'
            schema do
              key :example, Helper.error_404_msg(:Order)
            end
          end
        end
      end
    end
  end
end
