class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :size
  validates :quantity, presence: true, numericality: {only_integer: true,
    greater_than: Settings.quantity_min}

  delegate :name, to: :product, prefix: :product
end
