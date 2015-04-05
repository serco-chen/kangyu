module ApplicationHelper
  def format_time_for_blogs(time)
    time.strftime("%Y-%m-%d %H:%M")
  end

  def content_summary(body, length=120)
    body[0..length-1]
  end
end
