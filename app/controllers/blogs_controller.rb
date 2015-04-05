class BlogsController < ApplicationController
  layout "products"
  before_action :setup_news

  def index
    @blogs = Blog.order("updated_at desc").page params[:page]
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def search
    query = '%' + params[:q] + '%'
    @blogs = Blog.where('body LIKE ? OR title LIKE ?', query, query).page params[:page]
  end

end
