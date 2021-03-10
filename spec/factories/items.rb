FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    text                  {"テスト"}
    price                 {500}
    category_id           {1}
    item_status_id        {1}
    shipping_area_id      {1}
    shipping_cost_id      {1}
    shipping_days_id      {1}
    user
  end
end
