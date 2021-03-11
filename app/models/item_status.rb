class ItemStatus < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '良い' },
    { id: 2, name: '悪い' },
    { id: 3, name: '普通' },
  ]
  
  include ActiveHash::Associations
  has_many :items
end