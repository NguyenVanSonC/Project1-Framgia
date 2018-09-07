class Admin::BaseController < ApplicationController
  layout "admin"
  # before_filter :is_admin?
end

class Admin::ProductsController < Admin::BaseController
  before_action :find_product, only: %i(edit update destroy)

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "Create success"
      redirect_to admin_products_path
    else
      flash[:error] = "Create error"
      render :new
    end
  end

  def edit; end

  def update
    if @product.update_attributes product_params
      flash[:success] = "Update success"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Deleted"
    redirect_to admin_products_path
  end

  private

  def find_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = "Product not found"
  end

  def product_params
    params.require(:product).permit :name, :cost, :category_id
  end
end
