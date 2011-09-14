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
    @condition = ["disabled = ?", true]
    @per_page = 15
    get_videos
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
