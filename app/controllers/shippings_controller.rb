class ShippingsController < ApplicationController
  before_action :current_shipper, only: %i(index receive)
  before_action :find_shipping, only: %i(destroy)
  before_action :find_order, only: %i(receive destroy)

  def index
    @orders = Order.all
  end

  def receive
    @shipping = current_shipper.shippings.build
    @shipping.order_id = params[:order_id]
    respond_to do |format|
      if @shipping.save
        @order.update_attributes status: 1
        format.html{redirect_to timeline_orders_path}
        format.js
      else
        flash[:danger] = t "not_receive"
        format.html{}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @shipping.destroy
        @order.update_attributes status: 0
        flash[:success] = t "not_receive"
        format.html{redirect_to timeline_orders_path}
        format.js
      else
        flash[:danger] = t "receive"
        format.html
      end
    end
  end

  private

  def find_shipping
    @shipping = Shipping.find_by order_id: params[:order_id],
      shipper_id: current_shipper.id
  end

  def find_order
    @order = Order.find_by id: params[:order_id]
    valid_object? @order
  end
end
