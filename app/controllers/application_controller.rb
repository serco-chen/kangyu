class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def setup_products
    @products = Product.all
  end

  def setup_slide_news
    @slide_blogs = Blog.order('updated_at desc').limit(3)
  end
end
