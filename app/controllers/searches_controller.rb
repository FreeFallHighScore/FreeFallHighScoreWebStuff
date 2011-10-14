class SearchesController < ApplicationController
  def show
    if params[:query].blank?
      redirect_to :root
    else
      session[:query] = params[:query]
      redirect_to user_videos_path(params[:query])
    end
  end
end
