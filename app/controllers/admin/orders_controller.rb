class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :is_admin?
end

class Admin::OrdersController < Admin::BaseController
  before_action :find_order, only: %i(show show_shipper)
  before_action :load_order_items, only: %i(show)

  def index
    @orders = Order.all
  end

  def show_shipper
    @shipper = @order.shipper
  end

  private

  def find_order
    @order = Order.find_by id: params[:id]
    valid_object? @order
  end

  def load_order_items
    @order_items = @order.order_items
  end
end
