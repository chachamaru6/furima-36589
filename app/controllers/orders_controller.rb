class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
  end

  private
  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :address_num, :building_name, :telephone,).merge(user_id: current_user.id, item_id: params[:item_id])

end
