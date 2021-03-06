class Category < ApplicationRecord
  has_many :products
  scope :recent, ->{order name: :asc}
  scope :search, ->(search){where "categories.name like ?", "%#{search}%"}
  scope :cate_parents, ->{where child_of: nil}
  has_many :childs, class_name: Category.name, foreign_key: :child_of,
    dependent: :destroy
  has_one :parent, class_name: Category.name,
    primary_key: :child_of, foreign_key: :id
end
