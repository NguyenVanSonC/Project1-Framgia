class ShippersController < ApplicationController
  before_action :logged_in_user, only: %i(new create)
  before_action :find_shipper, only: %i(show)
  before_action :find_order, only: %i(finished_order)

  def new
    @shipper = current_user.build_shipper
  end

  def create
    @shipper = current_user.build_shipper shippper_params
    if @shipper.save
      flash[:success] = t "create_shipper"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @order_shippers = @shipper.orders
  end

  def finished_order
    @order.update_attributes status: 2
    respond_to do |format|
      format.html{redirect_to current_shipper}
      format.js
    end
  end

  private

  def shippper_params
    params.require(:shipper).permit :company, :motobike_number,
      :motobike_color, :id_number
  end

  def find_shipper
    @shipper = Shipper.find_by id: params[:id]
    valid_object? @shipper
  end

  def find_order
    @order = Order.find_by id: params[:order_id]
    valid_object? @order
  end
end
