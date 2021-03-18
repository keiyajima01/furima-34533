class OrdersController < ApplicationController

  def index
    @order_shipping = OrderShipping.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order_shipping = OrderShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :municipality, :address, :building_name, :phone_number, :shipping_area_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
    )
  end

end
