class Shipper < ApplicationRecord
  belongs_to :user
  has_many :shippings
  has_many :orders, through: :shippings
end
