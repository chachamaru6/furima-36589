class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_furima, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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
    redirect_to items_path if @item.user_id == current_user.id && @item.order.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :load_id, :prefecture_id, :schedule_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def set_furima
    @item = Item.find(params[:id])
  end

  def prevent_url
    redirect_to items_path if @item.user_id != current_user.id
  end
end
