class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_want

  def create
    @message = Message.create_message message_params[:text], current_user, @want
  end

  private
  def message_params
    params.require(:message).permit(:text)
  end

  def set_want
    @want = Want.find(params[:want_id])
  end
end
