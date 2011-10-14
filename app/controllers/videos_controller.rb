class VideosController < ApplicationController
  before_filter :find_object, :except => [:index]

  def index
    respond_to do |f|
      f.json { render :json => Video.enabled.drop_time.map{ |v|
        v.attributes.merge({
          "video_url" => "http://www.youtube.com/watch?v=#{v.youtube_id}",
          "thumbnail_url" => "http://i.ytimg.com/vi/#{v.youtube_id}/default.jpg"
        })
      }.to_json }
    end
  end

  def disable
    unless @video.update_attributes(:disabled => true)
      flash[:alert] = "Error updating video"
    end

    Video.rank

    redirect_to :leaderboard
  end

  def enable
    unless @video.update_attributes(:disabled => false)
      flash[:alert] = "Error updating video"
    end

    Video.rank

    redirect_to :moderate
  end

  private

  def find_object
    @video = Video.find(params[:id])
  end
end
