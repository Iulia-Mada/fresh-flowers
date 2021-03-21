module Swaggers
  module ProductModel
    extend ActiveSupport::Concern

    included do
      swagger_schema :ProductInput do
        key :required, [:name, :description, :color_name, :zodiac_sign, :price, :image]
        property :name do
          key :type, :string
          key :maxLength, 100
          key :description, 'Should be unique'
        end
        property :description do
          key :type, :string
        end
        property :color_name do
          key :type, :string
        end
        property :zodiac_sign do
          key :type, :string
        end
        property :price do
          key :type, :number
          key :format, :decimal
          key :description, '2 decimal number'
        end
        property :image do
          key :type, :string
          key :description, 'uploaded image'
        end
      end

      swagger_schema :Product do
        property :id do
          key :type, :string
          key :format, :uuid
        end
        property :name do
          key :type, :string
        end
        property :description do
          key :type, :string
        end
        property :color_name do
          key :type, :string
        end
        property :zodiac_sign do
          key :type, :string
        end
        property :price do
          key :type, :number
          key :format, :decimal
          key :description, '2 decimal number'
        end
        property :image do
          key :type, :string
          key :description, 'image path'
        end
      end

      swagger_schema :ProductInputForUpdate do
        property :name do
          key :type, :string
          key :maxLength, 100
          key :description, 'Should be unique'
        end
        property :description do
          key :type, :string
        end
        property :color_name do
          key :type, :string
        end
        property :zodiac_sign do
          key :type, :string
        end
        property :price do
          key :type, :number
          key :format, :decimal
          key :description, '2 decimal number'
        end
        property :image do
          key :type, :string
          key :description, 'uploaded image'
        end
      end
    end
  end
end
