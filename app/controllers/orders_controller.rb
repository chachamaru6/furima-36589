class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       pay_item
      @order_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private


  def order_params
    params.require(:order_address).permit(:post_number, :prefecture_id, :city, :address_num, :building_name, :telephone,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_4d7982b796b399f42a463ee7"
       Payjp::Charge.create(
         amount: order_address_params[:price],  # 商品の値段
         card: order_address_params[:token],    # カードトークン
         currency: 'jpy'                 # 通貨の種類（日本円）
       )
  end

  
end

