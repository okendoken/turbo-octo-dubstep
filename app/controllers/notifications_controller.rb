class NotificationsController < ApplicationController
  def update
    @event = RelatedEvent.find(params[:id])
    if @event.reader == current_user
      @event.read = true
      @event.save
    end
    render :nothing => true
  end
end
