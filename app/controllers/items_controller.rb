class ItemsController < ApplicationController
  def index
    @items = Item.order
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:name, :image).merge(user_id: current_user.id)
  end


end
