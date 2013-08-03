class HomeController < ApplicationController
  def index
    if user_signed_in?
      render :welcome
    end
  end
end
