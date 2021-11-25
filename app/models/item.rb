class Item < ApplicationRecord

  has_many :orders
  has_many :cart_items
  belongs_to :category
  attachment :image

end
