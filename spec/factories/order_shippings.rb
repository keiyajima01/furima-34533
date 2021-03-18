FactoryBot.define do
  factory :order_shipping do
    user_id     {'1'}
    item_id     {'1'}
    postal_code {'123-4567'}
    municipality { '東京都' } 
    address  { '東京1-1' } 
    building_name { '東京ハイツ' }
    phone_number {'09012345678'}
    shipping_area_id      {1}
    token  {'tok_xxxxxxxxxxxxxxxxx'}
  end
end
