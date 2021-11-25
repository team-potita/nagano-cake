class Address < ApplicationRecord
  belongs_to :end_user

  validates :name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
end
