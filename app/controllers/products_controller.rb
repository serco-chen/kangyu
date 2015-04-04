class ProductsController < ApplicationController
  def index
    @products = Product.order("updated_at desc")
  end

  def show
    @product = Product.find(params[:id])
    @other_products = Product.where("id <> ?", @product.id)
  end
end
