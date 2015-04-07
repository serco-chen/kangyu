class BlogsController < ApplicationController

  layout "home"
  before_action :setup_products, only: [:index, :show]
  before_action :setup_slide_news, only: [:show]

  def index
    @blogs = Blog.latest.page(params[:page])
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
