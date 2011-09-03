class UsersController < ApplicationController
  def videos
    respond_to do |f|
      f.json { render :json => Video.where("author = ? and disabled = ?", params[:user_id], false).map{ |v|
        v.attributes.merge({
          "video_url" => "http://www.youtube.com/watch?v=#{v.youtube_id}",
          "thumbnail_url" => "http://i.ytimg.com/vi/#{v.youtube_id}/default.jpg"
        })
      }.to_json }
    end
  end
end
