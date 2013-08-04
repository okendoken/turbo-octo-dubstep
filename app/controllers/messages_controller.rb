class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_want

  def create
    @message = Message.create(:text => message_params[:text], :from => current_user, :to => @want.user, :want => @want)
  end

  private
  def message_params
    params.require(:message).permit(:text)
  end

  def set_want
    @want = Want.find(params[:want_id])
  end
end
