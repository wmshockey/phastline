class ProgressbarsController < ApplicationController
  
  def show
    @progress_bar = current_user.progressbars.find(params[:id])
    render json: @progress_bar
  end

end