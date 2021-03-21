module Api
  module V1
    class ProductsController < ApplicationController
      include Swaggers::ProductsController

      before_action :set_product, only: [:show, :update]

      def index
        products = Product.search(params).order(:name).page(params[:page])

        render json: products,
               adapter: :json,
               each_serializer: ProductSerializer,
               meta: { total_records: products.total_count, total_pages: products.total_pages }
      end

      def show
        render json: @product, serializer: ProductSerializer
      end

      def create
        product = Product.new(product_params)

        if product.save
          render json: product, status: :created, serializer: ProductSerializer,
                 location: api_v1_product_url(product)
        else
          render json: { errors: product.errors, status: :unprocessable_entity }
        end
      end

      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      private

      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :description, :color_name, :zodiac_sign, :price, :image, :page)
      end
    end
  end
end
