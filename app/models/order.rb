class Order < ApplicationRecord

  belongs_to :end_user
  has_many :order_datails

  enum peyment_method: { credit_card: 0, transfer: 1 }

end
