class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    if message.save
      MessageNotifier.new_message(message).deliver_later
      render json: {message: "发送成功, 感谢您的关注"}
    else
      render json: {message: message.errors.to_a}, status: 400
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :phone_number, :content)
  end
end
