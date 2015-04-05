class BlogsController < ApplicationController

  layout "home"
  before_action :setup_products, only: [:index, :show]
  before_action :setup_slide_news, only: [:show]

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
