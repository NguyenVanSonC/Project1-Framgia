class Product < ApplicationRecord
  scope :by_order, ->{order id: :desc}
  ratyrate_rateable "quality"
  belongs_to :category
  scope :by_order, ->{order id: :desc}
  scope :order_cost, ->{order cost: :asc}
  scope :search, ->(search) do
    where "name like ? OR status like ? ", "%#{search}%", "%#{search}%"
  end
  scope :newest, ->{order created_at: :desc}
  scope :min_max_cost, ->(min, max){where "cost >= ? AND cost <= ?", min, max}
  scope :by_category, ->(cate_id){where category_id: cate_id if cate_id}
  scope :by_alphabet, ->{order name: :asc}
  scope :by_cost_min, ->(value){where "cost >= ?", value}
  scope :by_cost_max, ->(value){where "cost <= ?", value}

  validates :cost, presence: true, numericality: true
end
