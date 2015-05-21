class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render :index
    end
  end

  def show
    @order = Order.find_by! uid: params[:id]
    @item = Item.new
    @items = @order.items
  end

  def order_params
    params.require(:order).permit(
      :what,
      :expires_in,
      :limit
    )
  end
end
