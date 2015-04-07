class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def setup_products
    @products = Rails.cache.fetch [Product.latest.first, 'all'] do
      Product.latest.all
    end
  end

  def setup_slide_news
    @slide_blogs = Rails.cache.fetch [Blog.latest.first, 'lasted-3'] do
      Blog.latest.limit(3)
    end
  end
end
