class OrderShipping

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :municipality, :address, :building_name, :phone_number, :shipping_area_id, :token

  with_options presence:true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: " -（ハイフン）を含め入力してください"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/, message: "半角数字(ハイフンなし）を入力してください" }
    validates :shipping_area_id, numericality: { other_than: 0, message:"を入力してください" } 
    validates :token
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    shipping = Shipping.create(postal_code: postal_code, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, shipping_area_id: shipping_area_id, order_id: order.id)
  end

end