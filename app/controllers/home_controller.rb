class HomeController < ApplicationController
  def index
    if user_signed_in?
      render :feed
    end
  end
end
