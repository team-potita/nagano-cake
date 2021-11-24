class Item < ApplicationRecord

  has_many :orders
  belongs_to :category
  attachment :image

end
