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

  def google34c78ecc55cce2c5
    render :text => 'google-site-verification: google34c78ecc55cce2c5.html'
  end

  def google2bcb2e13fbb549a1
    render 'google2bcb2e13fbb549a1', :layout => nil
  end

  private

  def get_videos(attrs = {})
    @per_page ||= 5

    @videos = Video
    @videos = @videos.enabled unless attrs[:show_disabled]

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
