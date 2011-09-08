class SearchesController < ApplicationController
  def show
    session[:query] = params[:query]
    redirect_to user_videos_path(params[:query])
  end
end
