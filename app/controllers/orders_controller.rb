class OrdersController < ApplicationController
  before_action :current_cart, :current_quantity_cart, :sub_total,
    only: %i(new create)
  before_action :logged_in_user, only: %i(new create destroy index)
  before_action :find_order, only: %i(destroy show show_shipper)
  before_action :check_status_order, only: %i(destroy)
  before_action :load_order_items, only: %i(show)
  before_action :check_cart_empty, only: %i(new)

  def index
    @orders = current_user.orders
  end

  def show; end

  def new
    @order = current_user.orders.build
    @ship_cost = Ship.all
    respond_to do |format|
      format.html
      format.json{render json: @ship_cost}
    end
  end
  
  def create
    @order = current_user.orders.build order_params
    if @order.save
      create_order_item session[:cart], session[:size], @order
      flash[:success] = t "create_order"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    respond_to do |format|
      if @order.destroy
        flash[:success] = t "destroy"
        format.html
        format.js
      else
        flash[:danger] = t "notdestroy"
        format.html
      end
    end
  end

  def show_shipper
    @shipper = @order.shipper
  end

  private

  def order_params
    params.require(:order).permit :name, :address, :phone, :ship_id,
      :description, :total
  end

  def find_order
    @order = Order.find_by id: params[:id]
    valid_object? @order
  end

  def load_order_items
    @order_items = @order.order_items
  end
end
