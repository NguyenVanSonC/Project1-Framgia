class Product < ApplicationRecord
  scope :by_order, ->{order id: :desc}
end
