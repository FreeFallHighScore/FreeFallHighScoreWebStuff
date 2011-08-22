class HomeController < ApplicationController
  before_filter :validate, :only => [:moderate]
  def index
    get_videos
  end

  def moderate
    @condition = ["disabled = ?", true]
    @per_page = 15
    get_videos
  end

  def about
  end

  def lifevests
  end

  def disclaimer
  end

  def videos
    respond_to do |f|
      f.json { render :json => Video.where("disabled = ?", false).map{ |v|
        v.attributes.merge({
          "video_url" => "http://www.youtube.com/watch?v=#{v.youtube_id}",
          "thumbnail_url" => "http://i.ytimg.com/vi/#{v.youtube_id}/default.jpg"
        })
      }.to_json }
    end
  end

  private

  def get_videos
    @per_page ||= 5
    @condition ||= ["disabled = ?", false]
    @videos = Video.where(@condition).all.paginate(:page => params[:page], :per_page => @per_page)
  end

  def validate
    render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404 unless current_user and current_user.admin?
  end
end
