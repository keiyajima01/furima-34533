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

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
