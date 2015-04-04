class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def setup_news
    @popular_blogs = Blog.order("updated_at desc").limit(2)
  end
end
