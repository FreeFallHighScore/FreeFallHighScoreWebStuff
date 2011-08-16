class HomeController < ApplicationController
  def index
  end

  def test
    @videos = Video.all
  end

  def about
  end

  def lifevests
  end

  def disclaimer
  end
end
