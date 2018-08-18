module OrdersHelper
  def create_order_item cart, size, order
    @products = Product.by_id cart.keys
    @products.each do |item|
      quantity = (cart[item.id.to_s]).to_i
      unit_price = (item.cost).to_i
      total_price = quantity * unit_price
      size_id = (size[item.id.to_s]).to_i
      order_item = order.order_items.build product_id: item.id,
        order_id: order.id, quantity: quantity, unit_price: unit_price,
        total_price: total_price, size_id: size_id
      order_item.save
      reset_cart size_id, item.id.to_s, quantity
    end
  end

  def reset_cart size_id, product_id, quantity
    session.delete :cart
    session.delete :size
    product_size = ProductSize.find_by size_id: size_id, product_id: product_id.to_i
    total_quanity = product_size.quantity - quantity
    product_size.update_attributes quantity: total_quanity
  end
  
  def check_status_order
    unless @order.processing?
      flash[:danger] = t "order_shipping"
      redirect_to orders_path
    end
  end
end
