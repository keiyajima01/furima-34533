class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :item_status_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user == @item.user
  end
end
