module ShippersHelper
  def return_ship_cost order
    @ship_cost = Ship.find_by id: order.ship_id
    @ship_cost.price
  end

  def return_sum_ship_cost orders
    sum = 0
    orders.each do |order|
      next unless order.shipped?
      @ship_cost = Ship.find_by id: order.ship_id
      sum += @ship_cost.price
    end
    sum
  end
end
