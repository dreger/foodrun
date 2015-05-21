class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    order = Order.find(@item.order_id)
    respond_to do |format|
      if !order.expired? && @item.save
        format.js {}
      else
      end
    end
  end

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :order_id
    )
  end
end
