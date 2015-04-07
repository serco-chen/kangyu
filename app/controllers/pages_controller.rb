class PagesController < ApplicationController

  layout "home"
  before_action :setup_products, only: [:home]
  before_action :setup_slide_news, only: [:home]

  def home
  end
end
