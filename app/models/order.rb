class Order < ApplicationRecord
  belongs_to :user
  belongs_to :ship
  has_many :order_items, dependent: :destroy
  has_one :shipping
  has_one :shipper, through: :shipping
  enum status: {processing: 0, shipping: 1, shipped: 2, cancelled: 3}
  before_save :finalize

  def ship_cost
    ship_cost = Ship.find_by id: self.ship_id
    ship_cost.price
  end

  def finalize
    self[:subtotal] = "%.2f" % (self.total + ship_cost)
  end
end
