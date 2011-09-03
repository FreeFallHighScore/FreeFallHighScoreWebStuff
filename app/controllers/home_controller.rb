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
