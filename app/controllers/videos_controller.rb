class VideosController < ApplicationController
  before_filter :find_object

  def disable
    unless @video.update_attributes(:disabled => true)
      flash[:alert] = "Error updating video"
    end

    redirect_to :root
  end

  def enable
    unless @video.update_attributes(:disabled => false)
      flash[:alert] = "Error updating video"
    end

    redirect_to :moderate
  end

  private

  def find_object
    @video = Video.find(params[:id])
  end
end
