module Api
  module V1
    class OrderItemsController < ApplicationController
      include Swaggers::OrderItemsController

      before_action :set_order_item

      def update
        if @order_item.update(order_item_params)
          render json: @order_item
        else
          render json: @order_item.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @order_item.destroy
      end

      private

      def set_order_item
        @order_item = OrderItem.find(params[:id])
      end

      def order_item_params
        params.require(:order_item).permit(:quantity)
      end
    end
  end
end
