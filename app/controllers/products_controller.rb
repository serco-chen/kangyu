class ProductsController < ApplicationController

  layout "home"
  before_action :setup_products, only: [:show]

  def show
    @product = Product.find(params[:id])
  end

end
