class PagesController < ApplicationController

  layout "products"
  before_action :setup_news

  def intro
  end
end
