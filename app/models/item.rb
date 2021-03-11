class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_area
  belongs_to :shipping_cost
  belongs_to :shipping_days
  belongs_to :user
  # has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width number." }
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :item_status_id
      validates :shipping_area_id
      validates :shipping_cost_id
      validates :shipping_days_id
    end
  end
end
