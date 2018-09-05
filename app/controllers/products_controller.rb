class ProductsController < ApplicationController
  before_action :find_product, only: %i(show)
  before_action :load_comments, only: %i(show)

  def show
    @product = Product.find_by id: params[:id]
    @following = Following.find_by_followed_id @product.id
    return if @product
    flash[:danger] = t "products.product_not_found"
    redirect_to root_path
  end

  def filter_products
    if params[:cate_id]
      @products = Product.by_category params[:cate_id]
    elsif params[:alphabet]
      @products = Product.by_alphabet
    elsif params[:cost_min].present? || params[:cost_max].present?
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

  def load_comments
    @categories = Category.select(:id, :name, :child_of).recent
    @comments = @product.comments.paginate page: params[:page],
      per_page: Settings.pagecomment
    @comment = Comment.new
  end

  def find_product
    @product = Product.find_by id: params[:id]
    valid_object? @product
  end
end
