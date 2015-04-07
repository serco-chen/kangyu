class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_variants

  private

  def setup_variants
    if browser.tablet?
      request.variant = :tablet
    elsif browser.mobile?
      request.variant = :phone
    end
  end

  def setup_latest_products
    @latest_products = Rails.cache.fetch [Product.latest.first, 'lasted-9'] do
      Product.latest.limit(9)
    end
  end

  def setup_slide_news
    @slide_blogs = Rails.cache.fetch [Blog.latest.first, 'lasted-3'] do
      Blog.latest.limit(3)
    end
  end
end
