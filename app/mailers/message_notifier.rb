class MessageNotifier < ApplicationMailer
  default from: 'no-reply@nb-kydq.com'

  def new_message(message)
    @message = message
    mail(to: "9448228@qq.com")
  end
end
