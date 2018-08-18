class Size < ApplicationRecord
  scope :by_id, ->(value){where id: value}
  has_many :order_items
end
