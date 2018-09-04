class SearchProductsController < ApplicationController
  def index
    @products = Product.search(params[:query]).paginate page: params[:page],
      per_page: Settings.pageproduct
    return if @products
    flash[:danger] = t("search_empty")
    respond_to do |format|
      format.html
      format.js
    end
  end
end
