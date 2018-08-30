class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "products.product_not_found"
    redirect_to root_path
  end

  def filter_products
    case
    when params[:cate_id]
      @products = Product.by_category params[:cate_id]
    when params[:alphabet]
      @products = Product.by_alphabet
    when params[:cost_min].present? || params[:cost_max].present?
      @products = check_price params[:cost_min], params[:cost_max]
    end
  end

  private

  def check_price min, max
    if min.present? && max.present?
      Product.min_max_cost min, max
    elsif params[:cost_min].present?
      Product.by_cost_min min
    else
      Product.by_cost_max max
    end
  end
end
