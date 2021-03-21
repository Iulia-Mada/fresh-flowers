module Api
  module V1
    class OrdersController < ApplicationController
      include Swaggers::OrdersController

      before_action :set_order, only: [:show, :update, :destroy]

      def index
        orders = Order.includes(:order_items).page(params[:page])

        render json: orders,
               adapter: :json,
               each_serializer: OrderSerializer,
               meta: { total_records: orders.total_count, total_pages: orders.total_pages }
      end

      def show
        render json: @order, serializer: OrderSerializer
      end

      def create
        order_creator = OrderCreator.new(order_params)
        order_creator.run

        if order_creator.errors.present?
          render json: { errors: order_creator.errors }, status: :unprocessable_entity
        else
          render json: order_creator.order,
                 serializer: OrderSerializer,
                 status: :created,
                 location: api_v1_order_url(order_creator.order)
        end
      end

      def update
        if @order.update(order_params_for_update)
          render json: @order
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @order.destroy
      end

      private

      def set_order
        @order = Order.find(params[:id])
      end

      def order_params_for_update
        params.require(:order).permit(:email, :status)
      end

      def order_params
        params.require(:order).permit(:email, :status, :page, products: [:id, :quantity])
      end
    end
  end
end
