class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :item_status_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end
