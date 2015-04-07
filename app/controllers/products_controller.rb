class ProductsController < ApplicationController

  layout "home"
  before_action :setup_products, only: [:index, :show]

  def index
  end

  def show
    @product = Product.find(params[:id])
  end

end
