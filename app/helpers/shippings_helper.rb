module ShippingsHelper
  def check_receive? order, shipper
    @shipping = Shipping.find_by order_id: order.id, shipper_id: shipper.id
  end
end
