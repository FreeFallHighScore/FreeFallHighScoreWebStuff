class VideosController < ApplicationController
  before_filter :find_object, :only => [:show]

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])

    if @video.save
      redirect_to video_url(@video)
    else
      render :new
    end
  end

  def show
  end

  private

  def find_object
    @video = Video.find(params[:id])
  end
end
