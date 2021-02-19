
class OrderCreator
  attr_reader :order, :errors

  def initialize(opts)
    @options = opts
    @order = nil
    @errors = {}
  end

  def run
    check_products_presence
    return if @errors.any?

    ActiveRecord::Base.transaction do
      order = build_order

      if order.save
        @options[:products].each do |product|

          get_product = Product.find(product[:id])
          order_item = build_order_item(get_product, product[:quantity], order)

          unless order_item.save
            @errors = order_item.errors
            raise ActiveRecord::Rollback
          end

          order.order_items << order_item
        end

        @order = order
      else
        @errors = order.errors
      end
    end
  end

  private

  def check_products_presence
    unless @options[:products].present?
      @errors = { products: 'Products not present'}
    end
  end

  def build_order
    Order.new(email: @options[:email], status: Order.statuses[:processing])
  end

  def build_order_item(product, product_quantity, order)
    OrderItem.new(
      quantity: product_quantity,
      product_price: product.price,
      order: order,
      product: product
    )
  end
end
