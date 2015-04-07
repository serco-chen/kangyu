class ProductsController < ApplicationController

  layout "home"
  before_action :setup_latest_products, only: [:index, :show]

  def index
    @products = Rails.cache.fetch [Product.latest.first, 'all-products'] do
      Product.latest.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end
