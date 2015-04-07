class PagesController < ApplicationController

  layout "home"
  before_action :setup_latest_products, only: [:home], unless: proc { request.variant == :phone }
  before_action :setup_slide_news, only: [:home], unless: proc { request.variant == :phone }

  def home
    respond_to do |format|
      format.html do |html|
        html.phone do
          @first_blog = Blog.latest.first
          @first_product = Product.latest.first
        end
      end
    end
  end
end
