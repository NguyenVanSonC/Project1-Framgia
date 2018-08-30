class StaticPagesController < ApplicationController
  def home
    @products = Product.limit(Settings.num_features_items).order_cost
    @categories = Category.all.recent
  end
end
