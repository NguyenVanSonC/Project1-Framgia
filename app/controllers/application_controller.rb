class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper
  include OrdersHelper
  include ShippingsHelper
  include ShippersHelper

  def logged_in_user
    return if logged_in?
    flash[:danger] = t "login"
    redirect_to login_url
  end

  def valid_object? object
    render "layouts/404" unless object
  end

  def current_cart
    @products = Product.by_id session[:cart].keys
  end

  def current_quantity_cart
    @products.each do |item|
      @size = Size.find_by id: session[:size][item.id.to_s]
      item.quantity_cart = session[:cart][item.id.to_s]
      item.total_cart = item.cost * item.quantity_cart.to_i
      item.size_cart = @size.name
    end
  end

  def set_quantity_cart
    current_cart
    current_quantity_cart
  end

  def sub_total
    set_quantity_cart
    @sub_total = Settings.sub_total
    @products.each do |item|
      @sub_total += item.total_cart
    end
    @sub_total = "%.2f" % @sub_total
  end

  def check_quantity_size size_id, quantity
    @product_size = ProductSize.find_by id: size_id
    if @product_size.quantity < quantity
      flash[:danger] = t "out_of_stock"
      false
    end
  end
end
