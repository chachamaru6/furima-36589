class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_furima, only: [:show, :edit, :update]
  
  

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.user_id != current_user.id
      redirect_to items_path
    end
  end

  def update
     if @item.update(item_params)
      redirect_to item_path
     else
      render :edit
     end
     if @item.user_id != current_user.id
      redirect_to items_path
    end
  end






  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :load_id, :prefecture_id, :schedule_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_furima
    @item = Item.find(params[:id])
  end


end
