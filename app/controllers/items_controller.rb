class ItemsController < ApplicationController
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

  private

  def item_params
    @item = require(:item).permit(:name ,:image, :price, :category_id, :item_status, :shipping_cost_id, :shipping_area_id, :shipping_days_id)
  end
end
