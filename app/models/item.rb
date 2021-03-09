class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :shipping_area_id, numericality: { other_than: 1 }
end
