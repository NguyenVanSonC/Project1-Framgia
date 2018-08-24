class Product < ApplicationRecord
  scope :by_order, ->{order id: :desc}
  ratyrate_rateable "quality"
end
