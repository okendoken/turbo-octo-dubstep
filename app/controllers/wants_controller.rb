class WantsController < ApplicationController
  before_action :set_want, only: [:show]



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_want
    @want = Want.find(params[:id])
  end
end
