class HomeController < ApplicationController
  before_filter :validate, :only => [:moderate]

  def leaderboard
    get_videos
  end

  def show
    @page = params[:permalink]
    render @page
  end

  def moderate
    @per_page = 15
    get_videos(:show_disabled => true)
  end

  def about
    render :text => "BLAH"
  end

  def preservers
  end

  def where
  end

  def disclaimer
  end

  private

  def get_videos(attrs = {})
    @per_page ||= 5

    @videos = Video
    if attrs[:show_disabled]
      @videos = @videos.disabled
    else
      @videos = @videos.enabled
    end

    case params['sort_by']
    when 'recent'
      @videos = @videos.recent
    else
      @videos = @videos.drop_time
    end

    @videos = @videos.all.paginate(:page => params[:page], :per_page => @per_page)
  end

  def validate
    render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404 unless current_user and current_user.admin?
  end
end
