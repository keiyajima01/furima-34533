class ShippingCost < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '出品者' },
    { id: 2, name: '配送者' },
  ]
  include ActiveHash::Associations
  has_many :items
end