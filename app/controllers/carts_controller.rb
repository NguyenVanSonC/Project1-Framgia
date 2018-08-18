class CartsController < ApplicationController
  before_action :set_cart
  before_action :find_product, except: %i(index)
  before_action :current_cart, :current_quantity_cart, only: %i(index)

  def index; end

  def add_cart
    if session[:cart].key? @product.id.to_s
      @quantity = session[:cart][@product.id.to_s]
      @quantity = @quantity.to_i
      @quantity += params[:quantity].to_i
      session[:cart][@product.id.to_s] = @quantity.to_s if check_quantity_size params[:size_id], @quantity
    else
      session[:cart][@product.id.to_s] = params[:quantity]
    end
    session[:size][@product.id.to_s] = params[:size_id]
    respond_to do |format|
      format.html{redirect_to root_path}
    end
  end

  def remove_cart
    if session[:cart].key? @product.id.to_s
      session[:cart].delete @product.id.to_s
      session[:size].delete @product.id.to_s
    end
    respond_to do |format|
      format.html{}
      format.js
    end
  end

  def decrease
    if session[:cart].key? @product.id.to_s
      @quantity = session[:cart][@product.id.to_s]
      @quantity = @quantity.to_i
      @quantity -= Settings.quantity_default
      session[:cart][@product.id.to_s] = @quantity.to_s
    end
    redirect_to carts_path
  end

  def increase
    if session[:cart].key? @product.id.to_s
      @quantity = session[:cart][@product.id.to_s]
      @quantity = @quantity.to_i
      @quantity += Settings.quantity_default
      session[:cart][@product.id.to_s] = @quantity.to_s
    end
    redirect_to carts_path
  end

  private

  def find_product
    @product = Product.find_by id: params[:product_id]
    valid_object? @product
  end
end
