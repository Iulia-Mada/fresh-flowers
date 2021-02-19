module Swaggers
  module ProductsController
    extend ActiveSupport::Concern

    included do
      swagger_path '/api/v1/products' do
        operation :get do
          key :tags, [:product]
          key :summary, 'List all Products'
          key :description, 'Returns a list of products ordered by name'
          parameter Helper.color_name
          parameter Helper.zodiac_sign
          parameter Helper.page_parameter

          response 200 do
            key :description, :OK
            schema do
              property :products do
                key :type, :array
                items do
                  key :type, :object
                  key :'$ref', :Product
                end
              end
              property :meta do
                key :type, :object
                property :total_records do
                  key :type, :integer
                  key :description, 'Total count of products (not paginated)'
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

      swagger_path '/api/v1/products{id}' do
        operation :get do
          key :tags, [:product]
          key :summary, 'Find Product by ID'
          key :description, 'Return a single Product entity.'
          parameter Helper.id_parameter('product Id')

          response 200 do
            key :description, :OK
            schema do
              key :'$ref', :Product
            end
          end

          response 404 do
            key :description, 'Not Found'
            schema do
              key :example, Helper.error_404_msg(:Product)
            end
          end
        end
      end

      swagger_path '/api/v1/products' do
        operation :post do
          key :tags, [:product]
          key :summary, 'Create Product'
          key :description, 'Create a product entity.'
          parameter do
            key :name, :body
            key :in, :body
            key :description, 'Product to Create'
            schema do
              property :product do
                key :'$ref', :ProductInput
              end
            end
          end

          response 201 do
            key :description, :Created
            schema do
              key :'$ref', :Product
            end
          end

          response 422 do
            key :description, 'Unprocessable Entity'
            schema do
              key :example, 'name has already been taken / price can not be blank'
            end
          end
        end
      end

      swagger_path '/api/v1/products{id}' do
        operation :put do
          key :tags, [:product]
          key :summary, 'Update product'
          key :description, 'Update a product entity.'
          parameter Helper.id_parameter('product Id')
          parameter do
            key :name, :body
            key :in, :body
            key :description, 'product to Update'
            schema do
              property :product do
                key :'$ref', :ProductInputForUpdate
              end
            end
          end

          response 200 do
            key :description, :OK
            schema do
              key :'$ref', :Product
            end
          end

          response 404 do
            key :description, 'Not Found'
            schema do
              key :example, Helper.error_404_msg(:Product)
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
    end
  end
end
