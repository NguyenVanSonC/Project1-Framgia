class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  ratyrate_rateable "quality"
  belongs_to :category
  attr_accessor :quantity_cart, :total_cart, :size_cart
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :order_items
  enum sale: {disable: 0, able: 1}
  scope :by_order, ->{order id: :desc}
  scope :order_cost, ->{order cost: :asc}
  scope :search, ->(search){where "name like ?", "%#{search}%"}
  scope :search_category,
    ->(value){joins(:category).merge(Category.search(value))}
  scope :newest, ->{order created_at: :desc}
  scope :min_max_cost, ->(min, max){where "cost >= ? AND cost <= ?", min, max}
  scope :by_category, ->(cate_id){where category_id: cate_id if cate_id}
  scope :by_alphabet, ->{order name: :asc}
  scope :by_cost_min, ->(value){where "cost >= ?", value}
  scope :by_cost_max, ->(value){where "cost <= ?", value}
  scope :by_id, ->(value){where id: value}

  validates :cost, presence: true, numericality: true
end
