class Item < ApplicationRecord

  has_many :orders
  belongs_to :cart_item
  belongs_to :category
  attachment :image

end
