class UsersController < ApplicationController

  before_filter :get_videos
  def videos
    respond_to do |f|
      f.json {
        render :json => @videos.map{ |v|
          v.attributes.merge({
            "video_url" => "http://www.youtube.com/watch?v=#{v.youtube_id}",
            "thumbnail_url" => "http://i.ytimg.com/vi/#{v.youtube_id}/default.jpg"
          })
        }.to_json
      }
      f.html {
        @per_page ||= 2
        @query = session[:query]
        @videos = @videos.paginate(:page => params[:page], :per_page => @per_page)
        render '/home/index'
      }
    end
  end

  private

  def get_videos
    @videos = Video.where("author = ? and disabled = ?", params[:user_id], false)
  end
end
