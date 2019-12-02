class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user)
    @message = Message.new
  end
  
  def new
  end

  def create
    Message.create(message_params)
  end

  private
  def message_params
    params.require(:message).permit(:image, :content).merge(user_id: current_user.id)
  end
end
