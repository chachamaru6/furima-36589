class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :status_id, :load_id, :prefecture_id, :schedule_id, :price, :image).merge(user_id: current_user.id)
  end


end
