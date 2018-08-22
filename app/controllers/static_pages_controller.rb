class StaticPagesController < ApplicationController
  def home
    @products = Product.limit(Settings.num_features_items).by_order
  end
end
