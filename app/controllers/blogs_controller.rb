class BlogsController < ApplicationController
  layout "products"
  before_action :setup_sidebar_data

  def index
    @blogs = Blog.order("updated_at desc").page params[:page]
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private

  def setup_sidebar_data
    @popular_blogs = Blog.order("updated_at desc").limit(2)
  end

end
