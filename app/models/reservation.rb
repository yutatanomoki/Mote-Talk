class Reservation < ApplicationRecord
  def index
    @res = Order.page(params[:page])
  end
  
  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products.all
  end

end
