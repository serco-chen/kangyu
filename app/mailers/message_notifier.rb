class MessageNotifier < ApplicationMailer
  default from: 'no-reply@nb-kydq.com'

  def new_message(message)
    @message = message
    mail(to: "serco@126.com")
  end
end
