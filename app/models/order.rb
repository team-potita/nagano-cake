class Order < ApplicationRecord
  belongs_to :end_user
  belongs_to :item
  enum peyment_method: { credit_card: 0, transfer: 1 }

end
