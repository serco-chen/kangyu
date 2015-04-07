class ProductsController < ApplicationController

  layout "home"
  before_action :setup_latest_products, only: [:index, :show]

  def index
    @products = Product.order('updated_at desc').all
  end

  def show
    @product = Product.find(params[:id])
  end

end
